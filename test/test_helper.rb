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
  # include FactoryBot::Syntax::Methods

  def authenticated_user
    @user = create(:user)
    post api_v1_authenticate_path,params:{ data: {
                                                   type: "auth",
                                                    attributes: {
                                                      username: @user.username,
                                                      password: @user.password
                                                    }
                                                 }
                                         },
    headers: {'Accept': 'application/vnd.api+json'}
    @valid_token = JSON.parse(response.body)
    return @valid_token
  end
end

