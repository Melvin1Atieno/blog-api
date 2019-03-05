require 'test_helper'
module Api
  module V1
    class AuthenticationControllerTest < ActionDispatch::IntegrationTest

      setup do
        @user = User.create(username:'username', password:'password',full_name:'full name name')
      end
      test 'Should authenticate user with correct credentials'do	
        post api_v1_authenticate_path, 
          params:{
                   username: @user.username,
                   password: @user.password
                 },
          headers: {'Accept': 'application/vnd.api+json'}
        assert_response 200
      end

      test "Authenticates fails with invalid credentials" do
        post api_v1_authenticate_path, 
        params: {
          username: @user.username,
          password: "not_registered_user_password"
        },
        headers: {"Accept": "application/vnd.api+json"}
      assert_response 401
      end
   end
  end 
end
