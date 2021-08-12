class PriceSerializer < ActiveModel::Serializer
  attributes :id, :price
  has_one :product
end
