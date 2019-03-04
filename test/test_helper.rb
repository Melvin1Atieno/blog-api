ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'


class ActiveSupport::TestCase 

  include FactoryBot::Syntax::Methods
  # setup do
  #   User.create(username: "registered_user", password: "registered_user_password", full_name: "registered_user_full_name")
  # end
end

class ActionDispatch::IntegrationTest

  def authenticated_user
    # user
    @user = {
        username: "valid_user",
        password: "valid_password",
        full_name:  "valid_full_name"
      }

      
      # register user
      post api_v1_users_path,
      params:@user,
      headers: {"Accept": "Application/json"}
      
      
      # authenticate user
      post api_v1_authenticate_path, 
      params: @user,
      headers: {"Accept": "Application/json"}
      
      
      # get authorization token
      
      @valid_token = JSON.parse(response.body)
      
  #  binding.pry
  return @valid_token
  
  end
end