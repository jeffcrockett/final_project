class Api::V1::CommentsController < ApplicationController

    def index
        render json: Comment.all, include: ['replies.replies.replies.replies']
    end

    def update 
        Comment.find(params[:id]).update(comment_params)
        render json: current_user
    end

    def delete
        byebug
        Comment.find(params[:id]).destroy
        render json: current_user
    end

    private 
    def comment_params
        params.permit(:content)
    end
end
