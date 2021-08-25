class CotationSerializer < ActiveModel::Serializer
  attributes :id, :cotation_date
  has_one :price
  has_one :product
end
