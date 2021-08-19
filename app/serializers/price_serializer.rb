class PriceSerializer < ActiveModel::Serializer
  attributes :id, :price
  has_one :characteristic
  has_many :cotations
end
