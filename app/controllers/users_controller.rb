class UsersController < ApplicationController
  def register
    permitted = user_params
    
    #Checks to make sure we have all needed params to register
    if(!has_register_params(permitted))
      render json: build_res("Missing one or more required params.", nil)
      return
    end
    #Checks if username is already in db
    if(username_exist(permitted[:username]))
      render json: build_res("Username already in use.", nil)
      return
    end
    #Checks if emails already in db
    if(email_exist(permitted[:email]))
      render json: build_res("Email already in use.", nil)
      return
    end
  
    begin
      User.create(permitted)
    rescue StandardError => e
       render json: build_res("Error creating user: ".concat(e.to_s), nil)
       return
    end
  
    render json: build_res(nil, "success")
  end
  
  private
    def user_params
      params.permit(:username, :email, :password)
    end
    
    def build_res(error, data)
      return {
        :error => error ? error : nil,
        :data => data ? data: nil
      }
    end
    
    def has_register_params(permitted)
      return permitted.has_key?(:username) &&
      permitted.has_key?(:email) &&
      permitted.has_key?(:password)
    end
    
    def username_exist(username)
      puts username
      return (User.exists?(username: username))
    end
    
    def email_exist(email)
      return (User.exists?(email: email))
    end
      
      
      
  
end