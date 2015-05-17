module Api
  class SessionsController < Api::ApplicationController
    skip_before_action :require_user

    def create
      result = SignIn.call(login_params)
      if result.success?
        render json: result.auth_token, serializer: AuthTokenSerializer, status: :created
      else
        render json: { errors: result.errors }, status: :unprocessable_entity
      end
    end

    def destroy
      current_token.destroy if current_token
      head :no_content
    end

    private

    def login_params
      params.require(:session).permit(:email, :password)
    end
  end
end
