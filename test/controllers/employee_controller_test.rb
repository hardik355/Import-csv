require 'test_helper'

class EmployeeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get employee_index_url
    assert_response :success
  end

  test "should get create" do
    get employee_create_url
    assert_response :success
  end

  test "should get show" do
    get employee_show_url
    assert_response :success
  end

  test "should get update" do
    get employee_update_url
    assert_response :success
  end

  test "should get delete" do
    get employee_delete_url
    assert_response :success
  end

end
