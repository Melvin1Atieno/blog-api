module Api
    module V1
        class PostsController < ApplicationController


            #GET /posts
            def index
                posts = Post.order('created_at DESC')
                render json: {data:{	
                    type: 'post',	
                    attributes: {	
                        data:posts 	
                    }	
                }}, status: 200
            end

            # create a post
            def create
                post = Post.new(post_params)
                if post.save
                    render json: {
                        data: {
                            type: 'post',
                            attributes: {
                                data: post
                            }
                        }
                    }, status: 201
                else
                    render json: { 
                        errors:[
                        {
                            status: "400",
                            title: "Bad request",
                            detail: post.errors
                        }
                    ]

                    }, status: 400
                end
            end

            def show
                post = Post.find(params[:id])
                render json: {data:{	
                    type: 'post',
                    id: post.id	
                    attributes: post	
                }}, status: 200
            end

            private

            def post_params
                params.permit(:title, :text)
            end
        end
        
    end
end
