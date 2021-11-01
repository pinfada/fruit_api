class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :markets
  #has_many :prices
  has_many :characteristics
  #has_many :prices, serializer: CotationSerializer
end
