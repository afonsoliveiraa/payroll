require "application_system_test_case"

class NotesTest < ApplicationSystemTestCase
  setup do
    @note = notes(:one)
  end

  test "visiting the index" do
    visit notes_url
    assert_selector "h1", text: "Notes"
  end

  test "should create note" do
    visit notes_url
    click_on "New note"

    fill_in "Employee", with: @note.employee_id
    fill_in "End date", with: @note.end_date
    fill_in "Event", with: @note.event_id
    fill_in "Reference", with: @note.reference
    fill_in "Start date", with: @note.start_date
    fill_in "Value", with: @note.value
    click_on "Create Note"

    assert_text "Note was successfully created"
    click_on "Back"
  end

  test "should update Note" do
    visit note_url(@note)
    click_on "Edit this note", match: :first

    fill_in "Employee", with: @note.employee_id
    fill_in "End date", with: @note.end_date
    fill_in "Event", with: @note.event_id
    fill_in "Reference", with: @note.reference
    fill_in "Start date", with: @note.start_date
    fill_in "Value", with: @note.value
    click_on "Update Note"

    assert_text "Note was successfully updated"
    click_on "Back"
  end

  test "should destroy Note" do
    visit note_url(@note)
    click_on "Destroy this note", match: :first

    assert_text "Note was successfully destroyed"
  end
end
