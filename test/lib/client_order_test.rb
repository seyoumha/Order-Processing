require 'test_helper'

class ClientOrderTest < ActiveSupport::TestCase
  setup do
    @co = ClientOrder.new([
        "Jo",
        "jo@email.com",
        "123 test ave, 22929",
        '1234-2345-3453-3456',
        "6765445677",
        'honda',
        "accord",
        "120,000",
        10000
    ])
  end

  test "to_order should return a hash with customer information" do
    assert @co.to_order[:name] == "Jo"
    assert @co.to_order[:email] == "jo@email.com"
    assert @co.to_order[:full_address] == "123 test ave, 22929"
    assert @co.to_order[:cc_num] == '1234-2345-3453-3456'
    assert @co.to_order[:phone] == "6765445677"
    assert @co.to_order[:make] == "honda"
    assert @co.to_order[:model] == "accord"
    assert @co.to_order[:milage] == "120,000"
    assert @co.to_order[:price] == 10000
  end
end
