class AddUniqueIndexToCharacteristics < ActiveRecord::Migration[6.1]
  def change
    add_index :characteristics, [:unit, :origine, :certification], unique: true
  end
end
