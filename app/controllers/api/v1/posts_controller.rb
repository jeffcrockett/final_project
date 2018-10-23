class Api::V1::PostsController < ApplicationController
    skip_before_action :authorized, only: [:show, :index, :frontpage, :backpage]

    def index 
        byebug
        render json: Post.all, include: ['comments.replies']
    end

    def show
        render json: Post.find(params[:id]), include: ['comments.replies']
    end

    def create 
        render json: Post.create(post_params)
    end

    def update
        render json: Post.find(params[:id]).update(post_params)
    end

    def frontpage
        if params[:range]
            render json: Post.offset(params[:range]).order('upvotes - downvotes DESC').limit(25)
        else
            render json: Post.order('upvotes - downvotes DESC').limit(25)
        end
    end

    def backpage
        render json: Post.order('upvotes - downvotes ASC').limit(25)
    end

    def destroy
        render json: Post.find(params[:id]).destroy
    end

    private 
    def post_params
        params.require(:post).permit(:subforum_id, :title, :content, :user_id, :upvotes, :downvotes)
    end
end
