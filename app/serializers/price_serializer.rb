class PriceSerializer < ActiveModel::Serializer
  attributes :id, :price
  #belongs_to :product
  has_many :cotations
end
