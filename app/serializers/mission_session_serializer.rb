class MissionSessionSerializer < ActiveModel::Serializer
  attributes :id, :started_at, :completed_at, :status, :mission_id
end
