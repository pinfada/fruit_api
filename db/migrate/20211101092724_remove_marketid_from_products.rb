class RemoveMarketidFromProducts < ActiveRecord::Migration[6.1]
  def change
    remove_index :products, column: [:market], if_exists: true
  end
end
