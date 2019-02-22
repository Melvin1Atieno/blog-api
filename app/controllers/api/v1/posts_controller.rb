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

            # get post with id
            def show
                # post = Post.find("#{params[:id]}")
                if Post.find_by_id(params[:id]).nil?
                    render json: { 
                       data: "null"

                    }, status: 404

                else
                  post = Post.find(params[:id])
                    render json: {data:{	
                        type: 'post',
                        id: post.id,	
                        attributes:{                                                                             title: post.title,
                                 text: post.text}	
                    }}, status: 200  
                end
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

            

            private

            def post_params
                params.permit(:title, :text)
            end
        end
        
    end
end
