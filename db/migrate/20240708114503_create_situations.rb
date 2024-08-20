class CreateSituations < ActiveRecord::Migration[7.0]
  def change
    create_table :situations do |t|
      t.string :description
      t.boolean :active

      t.timestamps
    end
  end
end
