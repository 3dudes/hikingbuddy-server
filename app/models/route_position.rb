class RoutePosition < ActiveRecord::Base
  default_scope { order(:order) }
  
  belongs_to :mission

  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :mission_id, presence: true
  validates :order, presence: true
end
