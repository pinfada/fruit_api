class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name
  belongs_to :market
end
