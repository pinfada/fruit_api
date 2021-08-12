class CharacteristicSerializer < ActiveModel::Serializer
  attributes :id, :unit, :origine, :certification
  has_one :product
end
