class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :cpf
      t.date :date_of_birth
      t.date :admission_date
      t.date :termination
      t.references :role, null: false, foreign_key: true
      t.references :department, null: false, foreign_key: true
      t.references :sector, null: false, foreign_key: true
      t.string :address
      t.string :phone
      t.string :pension
      t.references :nature, null: false, foreign_key: true
      t.references :situation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
