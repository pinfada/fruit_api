class PriceSerializer < ActiveModel::Serializer
  attributes :id, :price
  has_one :market
end
