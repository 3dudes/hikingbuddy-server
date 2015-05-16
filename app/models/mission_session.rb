class MissionSession < ActiveRecord::Base
  validates :user_id, presence: true
  validates :mission_id, presence: true
  validates :status, presence: true
  validates :started_at, presence: true
  validates :completed_at, presence: true
end
