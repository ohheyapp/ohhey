class MissedConnection < ActiveRecord::Base
  belongs_to :user
  has_many :messages

  before_save :set_location

  private

  def set_location
    return false unless location.present?
    self.latitude, self.longitude = Geocoder.coordinates(self.location)
  end
end
