module Api
  module V1
    class UsersController < ApplicationController
      skip_before_action :authenticate_request
      def create
        @user = User.new(user_params[:attributes])
        if @user.save
          render json:@user, status: 201
        else
          render json: {errors:[{
                                    status: "400",
                                    title: "Bad request",
                                    detail:@user.errors
                                }]
                    }, status: 400
        end
      end
      private
      def user_params
        params.require(:data).permit(:type ,attributes:[:username, :password, :full_name])
      end
    end
  end
end
