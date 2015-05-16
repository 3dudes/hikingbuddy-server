class Mission < ActiveRecord::Base
  belongs_to :start_location, class_name: "Location", foreign_key: "start_location_id"
  belongs_to :end_location, class_name: "Location", foreign_key: "end_location_id"
  has_many :route_positions

  validates :start_location, presence: true
  validates :end_location, presence: true

  #after_create :create_route

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


  def import_route(file_name)
    route_positions.delete_all

     service = RouteImportService.new(file_name)
     service.path.each_with_index do |position, index|
       route_positions.create!(
         latitude: position[:latitude],
         longitude: position[:longitude],
         altitude: position[:altitude],
         order: index
       )
     end
   end
end
