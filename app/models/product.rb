class Product < ApplicationRecord
    #validates :name, uniqueness: true, on: :create
    validates :name, presence: { message: "must be given please" }
    validates :name, length: {minimum: 2}
    has_many :markets
    has_many :characteristics, :dependent => :destroy
    before_save { self.name = name.downcase }
end
