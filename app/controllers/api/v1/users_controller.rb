class Api::V1::UsersController < ApplicationController

    def create
        @user = User.create(user_params)
        render json: @user
    end

    def show
        render json: User.find(params[:id]), include: ['comments', 'posts']
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end

end