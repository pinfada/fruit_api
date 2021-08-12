class CreateCharacteristics < ActiveRecord::Migration[6.1]
  def change
    create_table :characteristics do |t|
      t.string :unit
      t.string :origine
      t.string :certification
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
