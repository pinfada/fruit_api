class Cotation < ApplicationRecord
  belongs_to :product
  belongs_to :price
  belongs_to :characteristic
end
