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

    def destroy
      if current_user.running_mission?
        current_user.running_mission.update(
          status: "aborted",
          completed_at: Time.current
        )

        head :no_content
      else
        render json: { errors: ["You have no running mission"] }, status: :ok
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
