class CreateInsses < ActiveRecord::Migration[7.0]
  def change
    create_table :insses do |t|
      t.date :star_date
      t.date :end_date
      t.decimal :lower_limit
      t.decimal :upper_limit
      t.decimal :aliquot

      t.timestamps
    end
  end
end
