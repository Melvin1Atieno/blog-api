require 'pry'
module Api
  module V1
    class PostsController < ApplicationController

     #Get all posts 
      def index
        @posts = Post.order('created_at DESC')
        render json:{data:{
                             type: 'post',	
                             attributes: {data:@posts}	
                            }}, status: 200
      end

      # Get post by id
      def show
        @post = Post.find_by_id(params[:id])
        if @post.nil?
          render json: { data: "null"}, status: 404
        else
          render json: response_params(@post), status: 200
        end
      end

      # create a post
      def create
        @user = User.find(params[:user_id])
        @user.posts.create(post_params[:attributes])
        render json: response_params(@user.posts.last), status: 201
      end

      #  update an article
      def update
        @post = Post.find_by_id(params[:id])
        if @post.nil?
          render json: {data: "null"}, status: 404
        else
          @updated_post = @post.update(post_params[:attributes])
          render json: response_params(@updated_post), status: 200
        end
      end

      # Delete an article
      def destroy
        @post = Post.find_by_id(params[:id])
        if @post.nil?
          render json: { data: "null"}, status: 404
        else
          @post.destroy
          render json: {data:{type: 'post',
                              attributes: {data: "deleted"}
                       }}, status: 204
        end
      end


      private

      def post_params
        params.require(:data).permit(:type ,attributes:[:title, :text, :user_id])
      end

      def response_params(post_attributes)
        return {data: {
            type: 'post',
            attributes: post_attributes
            }}
      end    
    end
  end
end
