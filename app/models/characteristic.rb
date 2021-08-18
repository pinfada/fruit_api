class Characteristic < ApplicationRecord
  belongs_to :product
  validates :unit, length: {minimum: 2}
  before_save { self.certification = certification.downcase }
end
