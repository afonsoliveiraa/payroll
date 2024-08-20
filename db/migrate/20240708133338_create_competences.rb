class CreateCompetences < ActiveRecord::Migration[7.0]
  def change
    create_table :competences do |t|
      t.string :description
      t.string :just_events

      t.timestamps
    end
  end
end
