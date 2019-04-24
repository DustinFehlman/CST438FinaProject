require 'test_helper'

class ComplaintsControllerTest < ActionController::TestCase
  
  fixtures :complaints
  
    test "get all complaints descending" do
      get :allComplaints
      assert_response :success
      assert_equal "{\"error\":null,\"data\":[{\"id\":2,\"userID\":\"1\",\"text\":\"blah blah blah blah number 2\",\"created_at\":\"2019-04-24T08:15:12.505Z\",\"updated_at\":\"2019-03-24T08:03:59.547Z\"},{\"id\":1,\"userID\":\"1\",\"text\":\"blah blah blah blah number 1\",\"created_at\":\"2019-04-24T08:15:12.505Z\",\"updated_at\":\"2018-02-24T08:03:45.547Z\"}]}", @response.body
    end
    
    
end
