class RemoveMarketIdFromProducts < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :market_id, :integer, if_exists: true
  end
end
