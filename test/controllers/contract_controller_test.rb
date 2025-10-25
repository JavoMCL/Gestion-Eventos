require "test_helper"

class ContractControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get contract_index_url
    assert_response :success
  end
end
