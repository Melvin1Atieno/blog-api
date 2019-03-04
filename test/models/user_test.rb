require 'test_helper'

class UserTest < ActiveSupport::TestCase

  # def setup
  #   @user = users(:one)
  # end

  test 'Should not save user without valid credentials' do
    @user = User.create
    assert @user.errors[:username].present?, "Does not contain error fpr invalid username"
    assert @user.errors[:full_name].present?, "Does not contain error for invalid username"
    assert @user.errors[:password].present?, "Does not contain error msg for invalid password"
  end

  test "Should create user with valid credentials" do
    @user = User.create(users(:one))
  end

  # test for post association 
  test 'should have many posts' do
    assert_equal 2, @user.posts.size
  end
end
