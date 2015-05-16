class User < ActiveRecord::Base
  has_many :mission_sessions

  validates :first_name, presence: true
  validates :last_name, presence: true
end
