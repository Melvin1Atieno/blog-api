module Api
    module V1
        class UsersController < ApplicationController
        
            def index
                @users = User.order('created_at DESC')
                render json: {data:{
                    type: 'user',
                    attributes: {
                        data:@user 
                    }
                }}, status: :ok
            end

            def create
                @user = User.new(user_params)
                if @user.save
                    render json: {data:{
                    type: 'user',
                    attributes: {
                        data:@user 
                    }
                }}, status: :created_at
                else
                    render json: {errors:[
                                data:@user.errors
                            ]
                        }
                end
            end

            private

            def user_params
                params.permit(:username, :password, :full_name)
            end
        end
    end
end
