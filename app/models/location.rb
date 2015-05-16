class Location < ActiveRecord::Base
  reverse_geocoded_by :latitude, :longitude

  validates :name, presence: true, length: { minimum: 3 }
end
