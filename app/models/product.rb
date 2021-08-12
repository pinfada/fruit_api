class Product < ApplicationRecord
    validates :name, presence: { message: "must be given please" }
    validates :name, length: {minimum: 2}
    belongs_to :market
    has_many :prices, :dependent => :destroy
    before_save { self.name = name.downcase }
end
