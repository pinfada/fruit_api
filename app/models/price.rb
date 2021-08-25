class Price < ApplicationRecord
  belongs_to :product
  has_many :cotations
  validates :price, presence: { message: "must be given please" }
end
