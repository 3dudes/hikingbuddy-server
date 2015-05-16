class Location < ActiveRecord::Base
  reverse_geocoded_by :latitude, :longitude

  validates :name, presence: true
end
