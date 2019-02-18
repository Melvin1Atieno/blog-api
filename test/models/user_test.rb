require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test 'invalid without username' do
    user = User.new(password: 'mypassword', full_name: 'new user')
    refute user.valid?
    assert_not_nil user.errors[:username]
  end

  test 'invalid without password' do
    user = User.new(username: 'user', full_name: 'new user')
    refute user.valid?
    assert_not_nil user.errors[:password]
  end

  test 'invalid without fullname' do
    user = User.new(username: 'user', password: 'mypassword')
    refute user.valid?
    assert_not_nil user.errors[:full_name]
  end
end
