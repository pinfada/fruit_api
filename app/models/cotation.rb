class Cotation < ApplicationRecord
  belongs_to :price
  belongs_to :product
end
