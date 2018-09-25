require 'test_helper'

class FinanceControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get finance_url
    assert_response :success
  end

  test "should assign orders" do
    get finance_url
    assert assigns[:orders]
  end

end
