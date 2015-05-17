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

    def route
      mission = Mission.find(params[:id])
      render json: mission.route_positions, each_serializer: RoutePositionSerializer, status: :ok, root: "route"
    end

    def height_profile
      mission = Mission.find(params[:id])
      render json: mission.height_profile, status: :ok, root: "height_profile"
    end

    def ranking
      mission = Mission.where(id: params[:id], status: "completed" )
      render json: mission.height_profile, status: :ok, root: "height_profile"
    end
  end
end
