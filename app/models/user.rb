class User < ActiveRecord::Base
  has_many :mission_sessions

  validates :first_name, presence: true
  validates :last_name, presence: true

  def running_mission
    @running_mission ||= mission_sessions.where(status: "started").take
  end

  def running_mission?
    running_mission.present?
  end
end
