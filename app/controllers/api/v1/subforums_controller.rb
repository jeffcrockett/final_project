class Api::V1::SubforumsController < ApplicationController
    skip_before_action :authorized, only: [:index, :show]
    
    def index 
        render json: Subforum.all, include: ['posts.comments.users']
    end

    def create
        render json: Subforum.create(subforum_params)
    end

    def show
        render json: Subforum.find(params[:id])
    end

    private

    def subforum_params
        params.permit(:name, :description)
    end
end
