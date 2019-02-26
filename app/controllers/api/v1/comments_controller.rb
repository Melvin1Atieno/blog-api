module Api
    module V1
        class CommentsController < ApplicationController

            def index
                @post = Post.find(params[:post_id])
                @comments = @post.comments
                render json: {data:{	
                    type: 'comment',	
                    attributes: {	
                        data:@comments 	
                    }	
                }}, status: 200
                    
            end

            def create 
                @user = User.find(params[:user_id])
                @post = Post.find(params[:post_id])
                @comment =@user.@post.comments.create(comment_params)
                if @comment.save
                    render json: {data:{
                            type: 'post',
                            attributes: {
                                data: @comment
                            }
                        }}, status: 201
                else
                    render json: { 
                        errors:[
                        {
                            status: "400",
                            title: "Bad request",
                            detail: @comment.errors
                        }]

                    }, status: 400
                end
            
            end


            private

            def comment_params
                params.permit(:body, :user_id, :post_id)
            end

        end
        
    end
end