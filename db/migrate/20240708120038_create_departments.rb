class CreateDepartments < ActiveRecord::Migration[7.0]
  def change
    create_table :departments do |t|
      t.string :description
      t.string :address
      t.string :phone

      t.timestamps
    end
  end
end
