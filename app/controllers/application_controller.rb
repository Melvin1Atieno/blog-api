class ApplicationController < ActionController::API
  before_action :authenticate_request
  attr_reader :current_user

  private
  def authenticate_request
    current_user = authorize_user(request.headers)
    render json: {
                  error: 'Not authorized'
                  }, status: 401 unless current_user
  end

  # check if user exists.
  def authorize_user(headers)
    token = http_auth_header(headers)
    decoded_auth_token = JsonWebToken.decode(token)
    @user = User.find(decoded_auth_token[:user_id])
    if !@user
      errors[:token] = 'Invalid token'
      return nil
    else
      return @user
    end
  end
  
  # get the token from header
  def http_auth_header(headers)
    @errors={}
    if headers['Authorization'].present?
      return headers['Authorization'].split(' ').last
    else
      @errors[:token] = 'Missing token'
    end
  end
end
