module Concerns::Sessions
    include ActiveSupport::Concern
  def log_in(user)
    session[:id] = user.id
  end
  
  def current_user
    if session[:id]
      @current_user ||= User.where(id: session[:id]).first
    end
  end
  
  def log_out
    session.delete(:id)
    @current_user = nil
  end
end