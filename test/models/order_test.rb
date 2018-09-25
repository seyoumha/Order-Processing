# == Schema Information
#
# Table name: orders
#
#  id           :integer          not null, primary key
#  order_id     :string
#  name         :string
#  email        :string
#  full_address :string
#  cc_num       :string
#  phone        :string
#  make         :string
#  model        :string
#  milage       :string
#  price        :decimal(, )
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  setup do 
    @order = Order.new(

      name: 'Rick Sanchez',
      email: 'myemail@email.com',
      full_address: '1234test ave',
      cc_num: '4444-3333-2222-1111',
      phone: '800-555-1212',
      make: 'Tesla',
      model: '3',
      milage: '12222',
      price: 37000
    )
  end

  test 'should be valid' do 
    assert @order.valid?
  end

  #test presence validations
  [:name,:email,:full_address,:cc_num,:phone,:make,:model,:milage,:price].each do |method_name|
    test "should require #{method_name}" do
      @order.send("#{method_name}=".to_sym, nil)
      assert_equal false, @order.valid?
    end
  end

  class UsedCarTest < OrderTest
    test "when milage is 0" do
      @order.milage = 0
      assert_equal false, @order.used_car?
    end

    test "when milage is more than 0" do
      @order.milage = 10000
      assert_equal true, @order.used_car?
    end
  end
end
