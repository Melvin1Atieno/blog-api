require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
    get '/api/v1/users'
    assert_response :ok
  end

  test "should create user" do
    assert_difference('User.count') do
      post '/api/v1/users',
      params:
      {"username": "username",
      "password": "password",
      "full_name": "full name"},
      headers: {"Accept": "Application/json"}
    end
  end
end
