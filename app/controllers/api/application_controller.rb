module Api
  class ApplicationController < ActionController::Base
    before_action :require_user

    def current_user
      @current_user ||= current_token.user if current_token
    end

    def current_token
      @current_token ||= AuthToken.find_by_token(params[:token])
    end

    private

    def require_user
      render json: { errors: ["You must be logged in"] }, status: :unauthorized unless current_user
    end
  end
end
