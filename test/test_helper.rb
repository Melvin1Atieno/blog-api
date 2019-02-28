ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'


class ActiveSupport::TestCase 
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

#  

  # Add more helper methods to be used by all tests here...
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