class MissionSession < ActiveRecord::Base
  belongs_to :user
  belongs_to :mission

  validates :user, presence: true
  validates :mission, presence: true
  validates :started_at, presence: true

  before_validation :set_started_at, on: :create

  enum status: [:started, :completed, :aborted]

  def score
    ((completed_at - started_at) * 24 * 60 / 1000).to_i if completed_at
  end

  private

  def set_started_at
    self.started_at = Time.current
  end
end
