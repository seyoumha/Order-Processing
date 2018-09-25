require 'test_helper'

class ShippingControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get shipping_index_url
    assert_response :success
  end

end
