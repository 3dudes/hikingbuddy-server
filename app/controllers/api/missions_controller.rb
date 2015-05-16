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
      resolution = mission.route_positions.count / 100
      altitudes = mission.route_positions.each_with_index.map do |position, counter|
        position.altitude if counter % resolution == 0
      end.compact
      render json: altitudes, status: :ok, root: "height_profile"
    end
  end
end
