class Location < ActiveRecord::Base
  reverse_geocoded_by :latitude, :longitude

  validates :name, presence: true
  validates :serial, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true

  def position
    { latitude: latitude, longitude: longitude }
  end
end
