class Api::V1::AuthenticationController < ApplicationController
    skip_before_action :authenticate_request

    def authenticate
        # binding.pry
        command = AuthenticateUser.call(params[:username], params[:password])

        if command.success?
            render json: {auth_token: command.result}, status: 200
        else
            render json: {error: command.errors}, status: :unauthorized
        end
    end

    private 
end
