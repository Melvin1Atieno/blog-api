require 'test_helper'

class Api::V1::AuthenticationControllerTest < ActionDispatch::IntegrationTest

  setup do
    # register user
    post api_v1_users_path,
      params:
     {
        username: "registered_user",
        password: "registered_user_password",
        full_name: "registered_user_full_name"
      },
      headers: {"Accept": "Application/json"}
  end
    


    test "authenticates user with correct credentials" do	
    post api_v1_authenticate_path, 
      params: {
        username: "registered_user",
        password: "registered_user_password"
      },
      headers: {"Accept": "Application/json"}
    assert_response 200
  end

    test "returns error when invalid credentials are passed" do
      post api_v1_authenticate_path, 
      params: {
        username: "registered_user",
        password: "registered_user_passwor"
      },
      headers: {"Accept": "Application/json"}
    assert_response 401
    end
end
