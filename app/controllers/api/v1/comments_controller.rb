require 'pry'
module Api
    module V1
        class CommentsController < ApplicationController

            def index
                @comments = Comment.all
                render json: {data:{	
                    type: 'comment',	
                    attributes: {	
                        data:@comments 	
                    }	
                }}, status: 200
                    
            end

            def create 
                @post = Post.find(comment_params[:post_id])
                @user = User.find(comment_params[:user_id])
                @new_comment = Comment.new(comment_params)
                @post.comments << @new_comment
                @user.comments << @new_comment
                # binding.pry
                if @new_comment.save
                    render json: {data:{
                            type: 'post',
                            attributes: {
                                data: @new_comment
                            }
                        }}, status: 201
                else
                    render json: { 
                        errors:[
                        {
                            status: "400",
                            title: "Bad request",
                            detail: @new_comment.errors
                        }]

                    }, status: 400
                end
            end
            def destroy
                if Comment.find_by_id(params[:id]).nil?
                    render json: { 
                       data: "null"
                    }, status: 404
                else
                    @comment = Comment.find(params[:id])
                    @comment.destroy
                    render json: {data:{
                            type: 'comment',
                            attributes: {
                                data: "deleted"
                            }
                        }}, status: 204
                end
            end

            def show
                if Comment.find_by_id(params[:id]).nil?
                    render json: { 
                       data: "null"

                    }, status: 404

                else
                  @comment = Comment.find(params[:id])
                  render json: {data:{
                    type: 'post',
                    attributes: {
                        data: @comment
                    }
                }}, status: 200
                end
            end

            def update
                if Comment.find_by_id(params[:id]).nil?
                    render json: { 
                       data: "null"
                    }, status: 404
                else
                    @comment = Comment.find(params[:id])
                    @updated_Comment = @comment.update(comment_params)
                    render json: {data:{
                        type: 'post',
                        attributes: {
                            data: @updated_comment
                        }
                    }}, status: 200
                end
            end

            private

            def comment_params
                params.permit(:body,:post_id,:user_id)
            end

        end
        
    end
end