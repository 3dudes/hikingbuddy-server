class Mission < ActiveRecord::Base
  belongs_to :start_location, class_name: "Location", foreign_key: "start_location_id"
  belongs_to :end_location, class_name: "Location", foreign_key: "end_location_id"

  validates :start_location, presence: true
  validates :end_location, presence: true
end
