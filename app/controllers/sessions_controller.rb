class SessionsController < ApplicationController
   include Concerns::Sessions
   
  def login
    user = User.where(username: params[:username]).first
    if user && user.password == params[:password]
      log_in user
      render json: build_res(nil, "User logged in.")
      return
    else
      render json: build_res("Unkown user or incorrect password.", nil)
      return
    end
  end

  def destroy
  end

  def build_res(error, data)
    return {
      :error => error ? error : nil,
      :data => data ? data: nil
    }
  end
  
end
