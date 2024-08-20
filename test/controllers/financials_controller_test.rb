require "test_helper"

class FinancialsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @financial = financials(:one)
  end

  test "should get index" do
    get financials_url
    assert_response :success
  end

  test "should get new" do
    get new_financial_url
    assert_response :success
  end

  test "should create financial" do
    assert_difference("Financial.count") do
      post financials_url, params: { financial: { competence_id: @financial.competence_id, department_id: @financial.department_id, employee_id: @financial.employee_id, nature_id: @financial.nature_id, note_id: @financial.note_id, reference: @financial.reference, role_id: @financial.role_id, sector_id: @financial.sector_id, situation_id: @financial.situation_id, value: @financial.value } }
    end

    assert_redirected_to financial_url(Financial.last)
  end

  test "should show financial" do
    get financial_url(@financial)
    assert_response :success
  end

  test "should get edit" do
    get edit_financial_url(@financial)
    assert_response :success
  end

  test "should update financial" do
    patch financial_url(@financial), params: { financial: { competence_id: @financial.competence_id, department_id: @financial.department_id, employee_id: @financial.employee_id, nature_id: @financial.nature_id, note_id: @financial.note_id, reference: @financial.reference, role_id: @financial.role_id, sector_id: @financial.sector_id, situation_id: @financial.situation_id, value: @financial.value } }
    assert_redirected_to financial_url(@financial)
  end

  test "should destroy financial" do
    assert_difference("Financial.count", -1) do
      delete financial_url(@financial)
    end

    assert_redirected_to financials_url
  end
end
