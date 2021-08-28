class Product < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: [:slugged, :finders]
    validates :name, uniqueness: true, on: :create
    validates :name, presence: { message: "must be given please" }
    validates :name, length: {minimum: 2}
    belongs_to :market
    has_many :characteristics
    has_many :prices
    has_many :cotations, through: :prices
    before_save { self.name = name.downcase }
end
