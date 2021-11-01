class CreateUnivers < ActiveRecord::Migration[6.1]
  def change
    create_table :univers do |t|
      t.references :market, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
