require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = users(:one)
  end

  test 'invalid without username' do
    @user.username = nil
    assert_not @user.save, 'saved user without username'
    assert_not_nil @user.errors[:username]
  end

  test 'invalid without password' do
    @user.password = nil
    assert_not @user.save, 'saved user without password'
    assert_not_nil @user.errors[:password]
  end

  test 'invalid without fullname' do
    @user.full_name = nil
    assert_not @user.save, 'saved user without full name'
    assert_not_nil @user.errors[:full_name]
  end
end
