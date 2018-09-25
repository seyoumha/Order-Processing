require 'csv'
class OrderImporter
  attr_accessor :file_name, :source_dir

  def initialize file_name:, source_dir:
    @file_name = file_name
    @source_dir = source_dir || "orders"
  end

  def process 
    file_path = Rails.root.join(@source_dir, @file_name)
    CSV.foreach(file_path, headers: true) do |row|
      co = ClientOrder.new(row)
      Order.create!(co.to_order)
    end
  end

end