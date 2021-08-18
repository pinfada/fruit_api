class Product < ApplicationRecord
    validates :name, presence: { message: "must be given please" }
    validates :name, length: {minimum: 2}
    belongs_to :market
    has_many :prices, :dependent => :destroy
    has_many :characteristics, :dependent => :destroy
    has_many :cotations, :through => :prices
    before_save { self.name = name.downcase }
end
