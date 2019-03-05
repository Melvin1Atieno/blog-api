require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  setup do
    @request_params[:data][:type] ='user'
    @request_params[:data][:attributes] =attributes_for(:user)
  end
  teardown do
    Rails.cache.clear
  end

  test 'should create user' do
    assert_difference('User.count') {
      post api_v1_users_path,
           params:@request_params,
           headers: {"Accept": "application/vnd.api+json"}
    }
    assert_response 201
  end
  test 'Should not create user without username' do
    assert_no_difference('User.count') {
      @request_params[:data][:attributes][:username] = nil
      post api_v1_users_path,
           params: @request_params,
           headers: {'Accept': 'application/vnd.api+json'}
    }
    assert_response 400
  end

  test 'Should not create user without password' do
    assert_no_difference('User.count') {
      @request_params[:data][:attributes][:password] = nil
      post api_v1_users_path,
      params:@request_params,
      headers: {'Accept': 'application/vnd.api+json'}
    }
    assert_response 400
  end
  
  test 'Should not create user without fullname' do
    assert_no_difference('User.count') {
      @request_params[:data][:attributes][:full_name] = nil
      post api_v1_users_path,
      params:@request_params,
      headers: {"Accept": "Application/json"}
    }
    assert_response 400
  end
end
