class Price < ApplicationRecord
  belongs_to :product
  validates :price, presence: { message: "must be given please" }
end
