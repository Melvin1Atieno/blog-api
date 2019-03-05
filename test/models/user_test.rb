require 'test_helper'
class UserTest < ActiveSupport::TestCase
  setup do
    @user_with_posts = create(:user_with_posts)
  end
  test 'Should not save user without valid credentials' do
    @new_user = User.create
    assert @new_user.errors[:username].present?, 'expects username error'
    assert @new_user.errors[:full_name].present?, 'expects full_name error'
    assert @new_user.errors[:password].present?, 'expects password error'
  end
  test 'Should create user with valid credentials' do
    assert_difference('User.count') do
      User.create(attributes_for(:user))
    end
  end

  test 'should have many posts' do
    assert_equal 3, @user_with_posts.posts.size
  end
end
