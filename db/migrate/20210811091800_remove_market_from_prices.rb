class RemoveMarketFromPrices < ActiveRecord::Migration[6.1]
  def change
    remove_reference :prices, :market, null: false, foreign_key: true
    add_reference :prices, :product, null: false, foreign_key: true
  end
end
