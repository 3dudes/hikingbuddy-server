class MissionSerializer < ActiveModel::Serializer
  attributes :id, :name, :distance, :average_time
  has_one :end_location, serializer: LocationSerializer
  has_one :start_location, serializer: LocationSerializer
end
