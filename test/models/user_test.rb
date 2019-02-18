require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = users(:Mel)
  end

  test 'invalid without username' do
    @user.username = nil
    refute @user.valid?, 'saved user without username'
    assert_not_nil @user.errors[:username]
  end

  test 'invalid without password' do
    @user.password = nil
    refute @user.valid?, 'saved user without password'
    assert_not_nil @user.errors[:password]
  end

  test 'invalid without fullname' do
    @user.full_name = nil
    refute @user.valid?, 'saved user without full name'
    assert_not_nil @user.errors[:full_name]
  end

  test '#posts' do
    assert_equal 2, @user.posts.size
  end

  test '#comments' do
    assert_equal 2, @user.comments.size
  end
end
