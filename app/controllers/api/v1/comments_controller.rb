class Api::V1::CommentsController < ApplicationController
    skip_before_action :authorized, only: [:index]
    def index
        render json: Comment.all, include: ['users,replies.replies.replies.replies']
    end

    def create
        render json: Comment.create(comment_params)
    end

    def update 
        Comment.find(params[:id]).update(comment_params)
        render json: current_user
    end

    def destroy
        Comment.find(params[:id]).destroy
        render json: current_user
    end

    private 
    def comment_params
        params.permit(:content, :post_id, :user_id)
    end
end
