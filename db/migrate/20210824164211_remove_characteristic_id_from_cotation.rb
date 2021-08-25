class RemoveCharacteristicIdFromCotation < ActiveRecord::Migration[6.1]
  def change
    remove_column :cotations, :characteristic_id, :integer, if_exists: true
  end
end
