class Market < ApplicationRecord
    validates :name, presence: true, uniqueness: true, on: :create
    validates :name, length: {minimum: 2}
    has_many :products
    before_save { self.name = name.downcase }
end
