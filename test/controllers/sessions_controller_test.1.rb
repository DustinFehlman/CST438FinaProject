require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  
  fixtures :users
    
    test "login user" do
      mockReq = {"username": "testUser1", "password": "testUserOnePassword"}
      post :login, params: mockReq
      assert_response :success
      assert_equal '{"error":null,"data":"User testUser1 logged in."}', @response.body
      assert_equal 1, session[:id]
    end
    
    test "invalid password" do
      mockReq = {"username": "testUser1", "password": "invalidPassword"}
      post :login, params: mockReq
      assert_response :success
      assert_equal '{"error":"Unkown user or incorrect password.","data":null}', @response.body
      assert_nil session[:id]
    end
    
    test "unkown username" do
      mockReq = {"username": "unkownUsername", "password": "testUserOnePassword"}
      post :login, params: mockReq
      assert_response :success
      assert_equal '{"error":"Unkown user or incorrect password.","data":null}', @response.body
      assert_nil session[:id]
    end
    
    test "get current user" do
      mockReq = {"username": "testUser1", "password": "testUserOnePassword"}
      post :login, params: mockReq
      get :getCurrentUser
      assert_response :success
      assert_equal '{"error":null,"data":"User: testUser1"}', @response.body
      assert_equal 1, session[:id]
    end
    
    test "logout user" do
      get :logout
      assert_response :success
      assert_equal '{"error":null,"data":"All users logged out."}', @response.body
      assert_nil session[:id]
    end

end
