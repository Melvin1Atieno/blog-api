require 'test_helper'
module Api
  module V1
    class AuthenticationControllerTest < ActionDispatch::IntegrationTest
      test "Does not authenticate user with correct credentials" do	
        post api_v1_authenticate_path, 
          params:{
                   username: "registered_user",
                   password: "registered_user_password"
                 },
          headers: {"Accept": "Application/json"}
        assert_response 200
      end

      test "Authenticates user with invalid credentials" do
        post api_v1_authenticate_path, 
        params: {
          username: "registered_user",
          password: "not_registered_user_password"
        },
        headers: {"Accept": "Application/json"}
      assert_response 401
      end
   end
  end 
end
