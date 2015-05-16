class MissionSession < ActiveRecord::Base
  belongs_to :user
  belongs_to :mission

  validates :user, presence: true
  validates :mission, presence: true
  validates :status, presence: true
  validates :started_at, presence: true

  before_validation :set_started_at, on: :create

  enum status: [:started, :completed]

  private

  def set_started_at
    self.started_at = Time.current
  end
end
