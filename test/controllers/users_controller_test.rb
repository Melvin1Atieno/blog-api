require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  test "should create user" do
    assert_difference('User.count') {
      post '/api/v1/users',
      params:
      {"username": "username",
      "password": "password",
      "full_name": "full name"},
      headers: {"Accept": "Application/json"}
  }
  assert_response 201
  end

  test "Should not create user without username" do
    assert_no_difference('User.count') {
      post '/api/v1/users',
      params:
      {
      "password": "password",
      "full_name": "full name"},
      headers: {"Accept": "Application/json"}
  }
  assert_response 400
  end

  test "Should not create user without password" do
    assert_no_difference('User.count') {
      post '/api/v1/users',
      params:
      {
      "username": "username",
      "full_name": "full name"},
      headers: {"Accept": "Application/json"}
  }
  assert_response 400
  end

  test "Should not create user without fullname" do
    assert_no_difference('User.count') {
      post '/api/v1/users',
      params:
      {
      "username": "username",
      "password": "password"},
      headers: {"Accept": "Application/json"}
  }
  assert_response 400
  end
end
