class Characteristic < ApplicationRecord
  has_many :products
  validates :unit, length: {minimum: 2}
  #validates :unit, uniqueness: { scope: [:origine, :certification] }
end
