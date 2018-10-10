class Api::V1::CommentsController < ApplicationController

    def index
        render json: Comment.all, include: ['replies.replies.replies.replies']
    end
end
