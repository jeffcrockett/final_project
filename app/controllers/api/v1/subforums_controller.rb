class Api::V1::SubforumsController < ApplicationController
    skip_before_action :authorized, only: [:index]
    
    def index 
        render json: Subforum.all, include: ['posts.comments.users']
    end
end
