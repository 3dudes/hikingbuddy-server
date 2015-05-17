module Api
  class SessionsController
    skip_before_filter :require_user, only: [:create, :destroy]

    def create
      result = SignIn.call(params)
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

    def params
      params.require(:session).permit(:email, :password)
    end
  end
end
