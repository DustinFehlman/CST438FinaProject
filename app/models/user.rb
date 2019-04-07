require 'bcrypt'
class User < ApplicationRecord
  include BCrypt
  validates :password, presence: true
  validates :username, presence: true
  validates :email, presence: true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
