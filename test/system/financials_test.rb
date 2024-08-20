require "application_system_test_case"

class FinancialsTest < ApplicationSystemTestCase
  setup do
    @financial = financials(:one)
  end

  test "visiting the index" do
    visit financials_url
    assert_selector "h1", text: "Financials"
  end

  test "should create financial" do
    visit financials_url
    click_on "New financial"

    fill_in "Competence", with: @financial.competence_id
    fill_in "Department", with: @financial.department_id
    fill_in "Employee", with: @financial.employee_id
    fill_in "Nature", with: @financial.nature_id
    fill_in "Note", with: @financial.note_id
    fill_in "Reference", with: @financial.reference
    fill_in "Role", with: @financial.role_id
    fill_in "Sector", with: @financial.sector_id
    fill_in "Situation", with: @financial.situation_id
    fill_in "Value", with: @financial.value
    click_on "Create Financial"

    assert_text "Financial was successfully created"
    click_on "Back"
  end

  test "should update Financial" do
    visit financial_url(@financial)
    click_on "Edit this financial", match: :first

    fill_in "Competence", with: @financial.competence_id
    fill_in "Department", with: @financial.department_id
    fill_in "Employee", with: @financial.employee_id
    fill_in "Nature", with: @financial.nature_id
    fill_in "Note", with: @financial.note_id
    fill_in "Reference", with: @financial.reference
    fill_in "Role", with: @financial.role_id
    fill_in "Sector", with: @financial.sector_id
    fill_in "Situation", with: @financial.situation_id
    fill_in "Value", with: @financial.value
    click_on "Update Financial"

    assert_text "Financial was successfully updated"
    click_on "Back"
  end

  test "should destroy Financial" do
    visit financial_url(@financial)
    click_on "Destroy this financial", match: :first

    assert_text "Financial was successfully destroyed"
  end
end
