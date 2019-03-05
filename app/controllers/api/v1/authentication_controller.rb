class Api::V1::AuthenticationController < ApplicationController
  skip_before_action :authenticate_request
  def authenticate
    @auth_token = authenticate_user(auth_params[:username], auth_params[:password])
    binding.pry
    if !@auth_token.nil? || !@auth_token.empty?
      render json: { auth_token: auth_token }, status: 200
    else
      render json: { error: errors }, status: :unauthorized
    end
  end


  private

  def auth_params
    params.permit(:username, :password)
  end
  
  def authenticate_user(username, password)
    user = User.find_by_username(username)
    if user && user.authenticate(password)
      return JsonWebToken.encode(user_id: user.id)
    else
      errors[:user_authentication] = 'Invalid credentials'
    end
  end


end
