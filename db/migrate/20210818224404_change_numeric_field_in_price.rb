class ChangeNumericFieldInPrice < ActiveRecord::Migration[6.1]
  def change
    change_column :prices, :price, :decimal, precision: 5, scale: 2
  end
end
