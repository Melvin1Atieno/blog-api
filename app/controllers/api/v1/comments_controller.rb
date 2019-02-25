class Api::V1::CommentsController < ApplicationController

    def index
        if Post.find_by_id(params[:id]).nil?
            render json: {
                data: "null"
            }, status: 404
        else
            comments = 
        end
    end
end
