class Api::V1::AuthenticationController < ApplicationController
  skip_before_action :authenticate_request
  def authenticate
    @auth_token = authenticate_user(auth_params[:attributes][:username], auth_params[:attributes][:password])
    if !@auth_token.nil?
      render json: { auth_token: @auth_token }, status: 200
    else
      render json: { error: @errors }, status: 401
    end
  end

  private

  def authenticate_user(username, password)
    @errors = {}
    user = User.find_by_username(username)
    if user && user.authenticate(password)
      return JsonWebToken.encode(user_id: user.id)
    else
      @errors[:user_authentication] = 'Invalid credentials'
      return nil
    end
  end
 
  def auth_params
    params.require(:data).permit(:type, attributes:[:username, :password])
  end
end
