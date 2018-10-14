class Api::V1::PostsController < ApplicationController
    skip_before_action :authorized, only: [:show]
    def show
        render json: Post.find(params[:id])
    end
end
