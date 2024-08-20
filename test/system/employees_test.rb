require "application_system_test_case"

class EmployeesTest < ApplicationSystemTestCase
  setup do
    @employee = employees(:one)
  end

  test "visiting the index" do
    visit employees_url
    assert_selector "h1", text: "Employees"
  end

  test "should create employee" do
    visit employees_url
    click_on "New employee"

    fill_in "Address", with: @employee.address
    fill_in "Admission date", with: @employee.admission_date
    fill_in "Cpf", with: @employee.cpf
    fill_in "Date of birth", with: @employee.date_of_birth
    fill_in "Department", with: @employee.department_id
    fill_in "Name", with: @employee.name
    fill_in "Nature", with: @employee.nature_id
    fill_in "Pension", with: @employee.pension
    fill_in "Phone", with: @employee.phone
    fill_in "Role", with: @employee.role_id
    fill_in "Sector", with: @employee.sector_id
    fill_in "Situation", with: @employee.situation_id
    fill_in "Termination", with: @employee.termination
    click_on "Create Employee"

    assert_text "Employee was successfully created"
    click_on "Back"
  end

  test "should update Employee" do
    visit employee_url(@employee)
    click_on "Edit this employee", match: :first

    fill_in "Address", with: @employee.address
    fill_in "Admission date", with: @employee.admission_date
    fill_in "Cpf", with: @employee.cpf
    fill_in "Date of birth", with: @employee.date_of_birth
    fill_in "Department", with: @employee.department_id
    fill_in "Name", with: @employee.name
    fill_in "Nature", with: @employee.nature_id
    fill_in "Pension", with: @employee.pension
    fill_in "Phone", with: @employee.phone
    fill_in "Role", with: @employee.role_id
    fill_in "Sector", with: @employee.sector_id
    fill_in "Situation", with: @employee.situation_id
    fill_in "Termination", with: @employee.termination
    click_on "Update Employee"

    assert_text "Employee was successfully updated"
    click_on "Back"
  end

  test "should destroy Employee" do
    visit employee_url(@employee)
    click_on "Destroy this employee", match: :first

    assert_text "Employee was successfully destroyed"
  end
end
