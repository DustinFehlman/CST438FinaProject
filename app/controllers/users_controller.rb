class UsersController < ApplicationController
  include Concerns::Regex

  def register
    begin
    permitted = user_params

    #Checks to make sure we have all needed params to register
    if(!has_register_username(permitted))
      render json: build_res("Missing username param.", nil)
      return
    end
    
    if(!has_register_email(permitted))
      render json: build_res("Missing email param.", nil)
      return
    end
    
    if(!has_register_password(permitted))
      render json: build_res("Missing password param.", nil)
      return
    end
    
    #Checks if username is already in db
    if(username_exist(permitted[:username]))
      render json: build_res("Username already in use.", nil)
      return
    end
    #Check if email is in valid format
    if(!valid_email(permitted[:email]))
      render json: build_res("Not valid email format.", nil)
      return
    end
    #Checks if emails already in db
    if(email_exist(permitted[:email]))
      render json: build_res("Email already in use.", nil)
      return
    end
  
    user = User.new(permitted)
    user.save
  
    render json: build_res(nil, "success")
    rescue StandardError => e
      render json: build_res(e.to_s, nil)
      return
    end
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
  
    def has_register_username(permitted)
      return permitted.has_key?(:username)
    end
    
    def has_register_email(permitted)
      return permitted.has_key?(:email)
    end
    
    def has_register_password(permitted)
      return permitted.has_key?(:password)
    end
    
    
    def username_exist(username)
      puts username
      return (User.exists?(username: username))
    end
    
    def email_exist(email)
      return (User.exists?(email: email))
    end
    
    def valid_email(email)
      return email =~ valid_email_regex
    end
end
