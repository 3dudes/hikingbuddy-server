module Api
  class MissionSessionsController < Api::ApplicationController
    def create
      result = CheckIn.call(user: current_user, location: location)
      if result.success?
        render json: result.session, serializer: MissionSessionSerializer, status: :ok
      else
        render json: { errors: result.errors }, status: :unprocessable_entity
      end
    end

    private

    def location
      @location ||= Location.find_by_serial!(mission_session_params[:serial])
    end

    def mission_session_params
      params.require(:mission_session).permit(:serial)
    end
  end
end
