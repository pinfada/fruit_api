class Characteristic < ApplicationRecord
  belongs_to :product
  validates :unit, length: {minimum: 2}
  #validates :unit, uniqueness: { scope: [:origine, :certification] }
end
