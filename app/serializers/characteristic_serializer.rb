class CharacteristicSerializer < ActiveModel::Serializer
  attributes :id, :unit, :origine, :certification
  belongs_to :product
end
