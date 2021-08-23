class Product < ApplicationRecord
    #validates :name, uniqueness: true, on: :create
    validates :name, presence: { message: "must be given please" }
    validates :name, length: {minimum: 2}
    belongs_to :market
    has_many :characteristics
    before_save { self.name = name.downcase }
end
