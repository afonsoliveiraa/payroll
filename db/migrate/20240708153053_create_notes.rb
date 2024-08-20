class CreateNotes < ActiveRecord::Migration[7.0]
  def change
    create_table :notes do |t|
      t.references :employee, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.decimal :value
      t.date :start_date
      t.date :end_date
      t.string :reference

      t.timestamps
    end
  end
end
