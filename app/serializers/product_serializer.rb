class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :markets
  has_many :characteristics
end
