require 'test_helper'

class UsersControllerTest < ActionController::TestCase
    
    fixtures :users
    
    def test_register
        mockReq = {username: :one.username, email: :one.email, password: :one.password}
        

    end
    
    private
    
    def user_params(mockReq)
        mockReq.require([:username, :email, :password])
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