class AddSlugToMarkets < ActiveRecord::Migration[6.1]
  def change
    add_column :markets, :slug, :string
    add_index :markets, :slug, unique: true
  end
end
