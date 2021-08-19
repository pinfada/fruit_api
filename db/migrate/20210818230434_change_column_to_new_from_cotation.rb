class ChangeColumnToNewFromCotation < ActiveRecord::Migration[6.1]
  def change
    add_reference :cotations, :characteristic, null: false, foreign_key: true
  end
end
