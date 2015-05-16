class LocationSerializer < ActiveModel::Serializer
  attributes :id, :name, :latitude, :longitude, :serial
end
