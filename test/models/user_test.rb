require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @email = "ASDF@example.com"
    @user = User.create(email: @email)
  end
  test "looks up case insensitive email" do
    assert_equal @user, User.find_by(email: @email.downcase)
  end
  test "can't duplicate case insensitive emails" do
    # DB constraint will raise an error
    # assert_raise(ActiveRecord::RecordNotUnique) { User.create(email: @email.downcase) }

    # validates_uniqueness_of will return a user object which is not persisted to the DB, and has an error on it
    assert_equal ["has already been taken"], User.create(email: @email.downcase).errors.messages[:email]
  end
end
