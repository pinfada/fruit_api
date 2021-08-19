class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name
  belongs_to :market
  has_many :characteristics
end
