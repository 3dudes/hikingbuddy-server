module Api
  class MissionsController < Api::ApplicationController
    def show
      mission = Mission.find(params[:id])
      render json: mission, serializer: MissionSerializer, status: :ok
    end

    def search
      mission = Mission.find_by_serial!(params[:serial])
      render json: mission, serializer: MissionSerializer, status: :ok
    end
  end
end
