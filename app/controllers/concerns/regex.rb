module Concerns::Regex
    include ActiveSupport::Concern
  def valid_email_regex
    return /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  end
end