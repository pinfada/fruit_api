class AddProductIdToMarkets < ActiveRecord::Migration[6.1]
  def change
    add_column :markets, :product_id, :integer
  end
end
