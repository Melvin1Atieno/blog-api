require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  setup do
    @user = users(:one)
  end

  teardown do
    Rails.cache.clear
  end

  test "should create user" do
    assert_difference('User.count') {
      post '/api/v1/users',
      params:
      {username: @user.username,
      password: @user.password,
      full_name: @user.full_name},
      headers: {"Accept": "Application/json"}
  }
  assert_response 201
  end

  test "Should not create user without username" do
    assert_no_difference('User.count') {
      post '/api/v1/users',
      params:
      {
      password: @user.password,
      full_name: @user.full_name},
      headers: {"Accept": "Application/json"}
  }
  assert_response 400
  end

  test "Should not create user without password" do
    assert_no_difference('User.count') {
      post '/api/v1/users',
      params:
      {
      username:@user.username,
      full_name: @user.full_name},
      headers: {"Accept": "Application/json"}
  }
  assert_response 400
  end

  test "Should not create user without fullname" do
    assert_no_difference('User.count') {
      post '/api/v1/users',
      params:
      {
      username:@user.username,
      password:@user.password},
      headers: {"Accept": "Application/json"}
  }
  assert_response 400
  end
end
