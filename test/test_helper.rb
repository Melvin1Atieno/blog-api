ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase 
  include FactoryBot::Syntax::Methods

  setup do
    @request_params = {data:{
                              type: nil,
                              attributes: nil
                            }
                      }
  end
end
class ActionDispatch::IntegrationTest
  include FactoryBot::Syntax::Methods

  def authenticated_user
    @user = create(user)
    # authenticate user
    binding.pry
    post api_v1_authenticate_path, 
    params: @user,
    headers: {'Accept': 'application/vnd.api+json'}
    # get authorization token
    @valid_token = JSON.parse(response.body)
  return @valid_token
  
  end
end

