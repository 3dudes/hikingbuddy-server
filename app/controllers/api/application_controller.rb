module Api
  class ApplicationController < ActionController::Base
    before_action :require_user

    def current_user
      @current_user ||= User.find_by_id(params[:user_id])
    end

    private

    def require_user
      render json: { errors: ["You must be logged in"] }, status: :unauthorized unless current_user
    end
  end
end
