require "application_system_test_case"

class SituationsTest < ApplicationSystemTestCase
  setup do
    @situation = situations(:one)
  end

  test "visiting the index" do
    visit situations_url
    assert_selector "h1", text: "Situations"
  end

  test "should create situation" do
    visit situations_url
    click_on "New situation"

    check "Active" if @situation.active
    fill_in "Description", with: @situation.description
    click_on "Create Situation"

    assert_text "Situation was successfully created"
    click_on "Back"
  end

  test "should update Situation" do
    visit situation_url(@situation)
    click_on "Edit this situation", match: :first

    check "Active" if @situation.active
    fill_in "Description", with: @situation.description
    click_on "Update Situation"

    assert_text "Situation was successfully updated"
    click_on "Back"
  end

  test "should destroy Situation" do
    visit situation_url(@situation)
    click_on "Destroy this situation", match: :first

    assert_text "Situation was successfully destroyed"
  end
end
