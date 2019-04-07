require 'test_helper'

class UsersControllerTest < ActionController::TestCase
    
    fixtures :users
    
    test "register user" do
        #Valid request test
        mockValidReq = {username: "ValidUserRequest" , email: "ValidEmailRequest@test.test", password: "ValidPasswordRequest"}
        puts mockValidReq
        #mockMissingEmailParamReq = "{username: \"missingEmailParamUserRequest\" email: \"ValidEmailRequest\", password: \"ValidPasswordRequest\"}"
        puts json: User.all
        post :register, params: {body: mockValidReq.to_json}
        puts json: User.all
        assert_response :success
        assert_equal true, User.exists?(username: "ValidUserRequest")
        #assert_equal "".to_json, @response.body
    end
    
        

  
=begin
  fixtures :all
  
  def setup 
     @game = game(:one)
  end

  # new should create a new game with word 'computer'
  def test_new_game
     get :start
     assert_response :success
     assert_not_nil :game
     assert_equal 'computer', Game.find(:id).word
    
  end   
   
  # correctly guess next letter of game :one
  def test_play_game_1
     get :play, params: { :id => 1 , :guess => 'o'}
     assert_response :success
     assert_not_nil :game
  end  
=end
  
end