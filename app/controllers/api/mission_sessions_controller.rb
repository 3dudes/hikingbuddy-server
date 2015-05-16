module Api
  class MissionSessionsController < Api::ApplicationController
    def create
    end

    private

    def mission_session_params
      params.require(:mission_session).permit(:serial)
    end
  end
end
