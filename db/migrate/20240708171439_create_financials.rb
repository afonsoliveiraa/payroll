class CreateFinancials < ActiveRecord::Migration[7.0]
  def change
    create_table :financials do |t|
      t.references :nature, null: false, foreign_key: true
      t.references :situation, null: false, foreign_key: true
      t.references :department, null: false, foreign_key: true
      t.references :sector, null: false, foreign_key: true
      t.references :employee, null: false, foreign_key: true
      t.references :role, null: false, foreign_key: true
      t.references :note, null: false, foreign_key: true
      t.decimal :value
      t.references :competence, null: false, foreign_key: true
      t.date :reference

      t.timestamps
    end
  end
end
