class Api::V1::PostsController < ApplicationController
    skip_before_action :authorized, only: [:show, :index]

    def index 
        render json: Post.all
    end

    def show
        render json: Post.find(params[:id])
    end

    def create 
        render json: Post.create(post_params)
    end

    def update
        render json: Post.update(post_params)
    end

    private 
    def post_params
        params.require(:post).permit(:subforum_id, :title, :content, :user_id)
    end
end
