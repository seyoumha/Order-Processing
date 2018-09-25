class OrderImporterTest < ActiveSupport::TestCase
  setup do
    Order.delete_all
    OrderImporter.new(file_name: "2_valid_orders.csv", source_dir: "test/fixtures").process
  end

  test 'should create 2 orders' do
    assert_equal 2, Order.count
  end

end