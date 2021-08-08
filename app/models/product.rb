class Product < ApplicationRecord
    validates :name, presence: true, uniqueness: true, on: :create
    validates :name, length: {minimum: 2}
    belongs_to :market
    before_save { self.name = name.downcase }

    define_index do
        indexes :name
        indexes market(:name), :as => :market
    end

end
