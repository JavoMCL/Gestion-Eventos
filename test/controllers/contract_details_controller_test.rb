require "test_helper"

class ContractDetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get contract_details_index_url
    assert_response :success
  end

  test "should get new" do
    get contract_details_new_url
    assert_response :success
  end

  test "should get edit" do
    get contract_details_edit_url
    assert_response :success
  end
end
