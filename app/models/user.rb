class User < ActiveRecord::Base
  has_secure_password

  has_many :mission_sessions, dependent: :destroy
  has_many :auth_tokens, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

  def running_mission
    @running_mission ||= mission_sessions.where(status: "started").take
  end

  def running_mission?
    running_mission.present?
  end
end
