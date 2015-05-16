module Api
  class UsersController < Api::ApplicationController
    def show
      render json: current_user, serializer: UserSerializer, status: :ok
    end
  end
end
