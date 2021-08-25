class RemoveCharacteristicsToCotations < ActiveRecord::Migration[6.1]
  def change
    remove_index :cotations, column: [:characteristic_id], if_exists: true
  end
end
