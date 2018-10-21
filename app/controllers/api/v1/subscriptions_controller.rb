class Api::V1::SubscriptionsController < ApplicationController
    def create
        render json: Subscription.create(subscription_params)
    end

    def destroy 
        render json: Subscription.find(params[:id]).destroy
    end

    def subscription_params
        params.permit(:user_id, :subforum_id)
    end
end