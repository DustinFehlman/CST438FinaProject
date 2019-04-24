require 'test_helper'

class ComplaintsControllerTest < ActionController::TestCase
  
  fixtures :complaints
  fixtures :users
  
    test "get all complaints descending" do
      get :allComplaints
      assert_response :success
      assert_equal "{\"error\":null,\"data\":[{\"id\":2,\"userID\":\"1\",\"text\":\"blah blah blah blah number 2\",\"created_at\":\"2019-04-24T08:15:12.505Z\",\"updated_at\":\"2019-03-24T08:03:59.547Z\"},{\"id\":1,\"userID\":\"1\",\"text\":\"blah blah blah blah number 1\",\"created_at\":\"2019-04-24T08:15:12.505Z\",\"updated_at\":\"2018-02-24T08:03:45.547Z\"}]}", @response.body
    end
    
    test "submit complaint" do
      mockReq = {"username": "testUser1", "text": "this is a test complaint entry. this has to be 80 chars long. We are almost there to get this test to pass."}
      session[:id] = 1
      post :submitComplaint, params: mockReq
      assert_response :success
      assert_equal '{"error":null,"data":"Comaplint submitted"}', @response.body
      complaint = Complaint.where(text: "this is a test complaint entry. this has to be 80 chars long. We are almost there to get this test to pass.").first
      assert_equal "1", complaint.userID
    end
    
    test "invlalid user submit complaint" do
      mockReq = {"username": "testUser2", "text": "this is a test complaint entry. this has to be 80 chars long. We are almost there to get this to work but user is invalid."}
      session[:id] = 1
      post :submitComplaint, params: mockReq
      assert_response :success
      assert_equal '{"error":"Passed username does not match logged in user.","data":null}', @response.body
    end
    
    test "invlalid authed submit complaint" do
      mockReq = {"username": "testUser2", "text": "this is a test complaint entry. this has to be 80 chars long. We are almost there to get this to work but user is invalid."}
      session[:id] = nil
      post :submitComplaint, params: mockReq
      assert_response :success
      assert_equal '{"error":"No user logged in. Uable to submit","data":null}', @response.body
    end
    
    test "missing username complaint" do
      mockReq = {"text": "this is a test complaint entry. this has to be 80 chars long. We are almost there to get this to work but user is invalid."}
      session[:id] = 1
      post :submitComplaint, params: mockReq
      assert_response :success
      assert_equal '{"error":"Missing username param.","data":null}', @response.body
    end
    
    test "missing text submit complaint" do
      mockReq = {"username": "testUser2"}
      session[:id] = 1
      post :submitComplaint, params: mockReq
      assert_response :success
      assert_equal '{"error":"Missing complaint text.","data":null}', @response.body
    end
    
    test "invalid user submit complaint" do
      mockReq = {"username": "testUser2", "text": "this is a test complaint entry. this has to be 80 chars long. We are almost there to get this to work but user is invalid."}
      session[:id] = 999999999
      post :submitComplaint, params: mockReq
      assert_response :success
      assert_equal '{"error":"Invalid user.","data":null}', @response.body
    end
    
    test "short text submit complaint" do
      mockReq = {"username": "testUser2", "text": "th to get this to work but user is invalid."}
      session[:id] = 2
      post :submitComplaint, params: mockReq
      assert_response :success
      assert_equal '{"error":"Invalid complaint length","data":null}', @response.body
    end
    
end
