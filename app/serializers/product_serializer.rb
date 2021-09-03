class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name
  belongs_to :market, serializer: MarketSerializer
  has_many :prices
  has_many :characteristics
  #has_many :prices, serializer: CotationSerializer
end
