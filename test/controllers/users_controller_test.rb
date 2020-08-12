require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.new(name: "Naoya", email: "sample@sample.com", password: "passw0rd", password_confirmation: "passw0rd")
  end
  
  test "should not valid name blank" do
    @user.name = "    "
    assert_not @user.valid?
  end

end
