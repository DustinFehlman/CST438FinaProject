require 'test_helper'

class UsersControllerTest < ActionController::TestCase
    
    fixtures :users
    
    test "register user with valid request" do
        mockReq = {"username": "ValidUserRequest" , "email": "ValidEmailRequest@test.test", "password": "ValidPasswordRequest"}
        post :register, params: mockReq
        assert_response :success
        assert_equal '{"error":null,"data":"success"}', @response.body
        assert_equal true, User.exists?(username: "ValidUserRequest")
    end

    test "dont register user with no email" do
        mockReq = {"username": "NoEmailUserRequest" , "password": "NoEmailPasswordRequest"}
        post :register, params: mockReq
        assert_response :success
        assert_equal '{"error":"Missing email param.","data":null}', @response.body
        assert_equal false, User.exists?(username: "NoEmailUserRequest")
    end
    
    test "dont register user with no username" do
        mockReq = {"email": "NoUsernameRequest@test.test", "password": "NoUsernamePasswordRequest"}
        post :register, params: mockReq
        assert_response :success
        assert_equal '{"error":"Missing username param.","data":null}', @response.body
        assert_equal false, User.exists?(email: "NoUsernameRequest@test.test")
    end
    
    test "dont register user with no password" do
        mockReq = {"email": "NoPasswordRequest@test.test", "username": "NoPasswordUserRequest"}
        post :register, params: mockReq
        assert_response :success
        assert_equal '{"error":"Missing password param.","data":null}', @response.body
        assert_equal false, User.exists?(username: "NoPasswordUserRequest")
    end
    
     test "dont register if email already in db" do
        mockReq = {"username": "validTestUser100" , "email": "testUser1@test.test", "password": "testUserPassword"}
        post :register, params: mockReq
        assert_response :success
        assert_equal '{"error":"Email already in use.","data":null}', @response.body
        emailList = User.where(email: "testUser1@test.test")
        assert_equal 1, emailList.length
    end
    
    test "dont register if username already in db" do
        mockReq = {"username": "testUser1" , "email": "validTestUser100@test.test", "password": "testUserPassword"}
        post :register, params: mockReq
        assert_response :success
        assert_equal '{"error":"Username already in use.","data":null}', @response.body
        usernameList = User.where(username: "testUser1")
        assert_equal 1, usernameList.length
    end
    
    test "dont register if email invalid" do
        mockReq = {"username": "invalidEmailUsername" , "email": "invalidEmail", "password": "testUserPassword"}
        post :register, params: mockReq
        assert_response :success
        assert_equal '{"error":"Not valid email format.","data":null}', @response.body
        assert_equal false, User.exists?(email: "invalidEmail")
    end
    
end
