require "application_system_test_case"

class InssesTest < ApplicationSystemTestCase
  setup do
    @inss = insses(:one)
  end

  test "visiting the index" do
    visit insses_url
    assert_selector "h1", text: "Insses"
  end

  test "should create inss" do
    visit insses_url
    click_on "New inss"

    fill_in "Aliquot", with: @inss.aliquot
    fill_in "End date", with: @inss.end_date
    fill_in "Lower limit", with: @inss.lower_limit
    fill_in "Star date", with: @inss.star_date
    fill_in "Upper limit", with: @inss.upper_limit
    click_on "Create Inss"

    assert_text "Inss was successfully created"
    click_on "Back"
  end

  test "should update Inss" do
    visit inss_url(@inss)
    click_on "Edit this inss", match: :first

    fill_in "Aliquot", with: @inss.aliquot
    fill_in "End date", with: @inss.end_date
    fill_in "Lower limit", with: @inss.lower_limit
    fill_in "Star date", with: @inss.star_date
    fill_in "Upper limit", with: @inss.upper_limit
    click_on "Update Inss"

    assert_text "Inss was successfully updated"
    click_on "Back"
  end

  test "should destroy Inss" do
    visit inss_url(@inss)
    click_on "Destroy this inss", match: :first

    assert_text "Inss was successfully destroyed"
  end
end
