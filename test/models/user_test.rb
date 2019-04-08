require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "no saving with missing params" do
     user = User.new
     assert_not user.save
  end
end
