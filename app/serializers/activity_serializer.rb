class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :started_at, :completed_at, :status, :mission_id, :score

  has_one :user, serializer: UserSerializer
  has_one :mission, serializer: CompactMissionSerializer
end
