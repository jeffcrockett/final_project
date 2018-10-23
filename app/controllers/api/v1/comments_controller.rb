class Api::V1::CommentsController < ApplicationController
    skip_before_action :authorized, only: [:index]
    def index
        render json: Comment.all, include: ['users, replies, posts']
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

    def reply
        comment = Comment.create(comment_params)
        parent_comment = Comment.find(params[:parent_id])
        parent_comment.replies << comment 
        render json: parent_comment
    end

    private 
    def comment_params
        params.permit(:content, :post_id, :user_id, :parent_id, :upvotes, :downvotes)
    end
end
