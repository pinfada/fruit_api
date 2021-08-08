class AddMarketRefToProducts < ActiveRecord::Migration[6.1]
  def change
    add_reference :products, :market, null: false, foreign_key: true
  end
end
