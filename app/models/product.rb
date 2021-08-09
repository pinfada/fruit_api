class Product < ApplicationRecord
    validates :name, presence: { message: "must be given please" }, uniqueness: true, on: :create
    validates :name, length: {minimum: 2}
    belongs_to :market
    before_save { self.name = name.downcase }
end
