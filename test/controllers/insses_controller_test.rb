require "test_helper"

class InssesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @inss = insses(:one)
  end

  test "should get index" do
    get insses_url
    assert_response :success
  end

  test "should get new" do
    get new_inss_url
    assert_response :success
  end

  test "should create inss" do
    assert_difference("Inss.count") do
      post insses_url, params: { inss: { aliquot: @inss.aliquot, end_date: @inss.end_date, lower_limit: @inss.lower_limit, star_date: @inss.star_date, upper_limit: @inss.upper_limit } }
    end

    assert_redirected_to inss_url(Inss.last)
  end

  test "should show inss" do
    get inss_url(@inss)
    assert_response :success
  end

  test "should get edit" do
    get edit_inss_url(@inss)
    assert_response :success
  end

  test "should update inss" do
    patch inss_url(@inss), params: { inss: { aliquot: @inss.aliquot, end_date: @inss.end_date, lower_limit: @inss.lower_limit, star_date: @inss.star_date, upper_limit: @inss.upper_limit } }
    assert_redirected_to inss_url(@inss)
  end

  test "should destroy inss" do
    assert_difference("Inss.count", -1) do
      delete inss_url(@inss)
    end

    assert_redirected_to insses_url
  end
end
