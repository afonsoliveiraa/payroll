class ChangeNoteToEventInFinancials < ActiveRecord::Migration[7.0]
  def change
    remove_reference :financials, :note, foreign_key: true
    add_reference :financials, :event, foreign_key: true, null: false
  end
end
