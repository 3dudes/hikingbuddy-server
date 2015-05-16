class Mission < ActiveRecord::Base
  belongs_to :start_location, class_name: "Location", foreign_key: "start_location_id"
  belongs_to :end_location, class_name: "Location", foreign_key: "end_location_id"

  validates :start_location, presence: true
  validates :end_location, presence: true

  def self.by_serial(serial)
    Mission
      .joins("INNER JOIN locations AS start_location ON missions.start_location_id = start_location.id")
      .joins("INNER JOIN locations AS end_location ON missions.end_location_id = end_location.id")
      .where("start_location.serial = :serial OR end_location.serial = :serial", serial: serial)
  end

  def self.find_by_serial(serial)
    by_serial(serial).take
  end

  def self.find_by_serial!(serial)
    by_serial(serial).take!
  end

  after_create do
    fetch_service = FetchRouteService.new(start_location.position, end_location.position)
    fetch_service.fetch
  end
end
