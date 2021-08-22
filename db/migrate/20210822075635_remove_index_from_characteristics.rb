class RemoveIndexFromCharacteristics < ActiveRecord::Migration[6.1]
  def change
    remove_index :characteristics, column: [:unit, :origine, :certification], if_exists: true
  end
end
