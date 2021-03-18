class Store < ApplicationRecord
  validates :name, presence: true
  validates :longitude, presence: true
  validates :latitude, presence: true
  geocoded_by :latitude
  geocoded_by :longitude
  has_one_attached :photo
  after_validation :geocode, if: :will_save_change_to_location?
end
