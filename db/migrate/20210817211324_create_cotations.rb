class CreateCotations < ActiveRecord::Migration[6.1]
  def change
    create_table :cotations do |t|
      t.date :cotation_date
      t.references :price, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
