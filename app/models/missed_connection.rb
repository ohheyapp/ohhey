class MissedConnection < ActiveRecord::Base
  belongs_to :user
  has_many :messages

  before_save :set_location, :strip_answer

  default_scope -> { where(active: true) }

  private

  def set_location
    return unless location.present?
    self.latitude, self.longitude = Geocoder.coordinates(self.location)
  end

  def strip_answer
    self.answer = self.answer.downcase.strip
  end
end
