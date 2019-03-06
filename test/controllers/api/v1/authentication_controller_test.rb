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
                   data: {
                     type: "auth",
                     attributes: {
                        username: @user.username,
                        password: @user.password
                     }
                   }
                 },
          headers: {'Accept': 'application/vnd.api+json'}
        assert_response 200
      end

      test 'Authenticates fails with invalid credentials' do 
        post api_v1_authenticate_path, 
        params:{
                 data:{
                         type: 'auth',
                         attributes: {
                                        username: 'unregistered',
                                        password: @user.password
                                     }
                       }
               },
        headers: {'Accept': 'application/vnd.api+json'}
        assert_response 401
      end
    end
  end 
end
