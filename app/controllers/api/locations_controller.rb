module Api
  class LocationsController < Api::ApplicationController
    def index
      locations = Location.all
      render json: locations, each_serializer: LocationSerializer
    end
  end
end