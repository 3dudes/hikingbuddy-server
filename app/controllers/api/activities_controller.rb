module Api
  class ActivitiesController < Api::ApplicationController
    def index
      activities =  MissionSession.completed.order(completed_at: :desc)
      render json: activities, each_serializer: MissionSessionSerializer, status: :ok
    end
  end
end
