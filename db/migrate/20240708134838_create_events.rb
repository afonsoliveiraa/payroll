class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :description
      t.string :type_event
      t.string :formula
      t.boolean :inss
      t.boolean :irrf
      t.boolean :rpps

      t.timestamps
    end
  end
end
