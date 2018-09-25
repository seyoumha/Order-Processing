namespace :orders do
  desc "Import all orders from all files found in /orders"
  task import: :environment do
    entries = Dir.entries("./orders")
    entries.each do |entry|
      unless entry.first == '.'
        ap "Processing file #{entry}"
        OrderImporter.new(file_name: entry, source_dir: "orders").process
      end
    end
  end

  desc "Delete all orders"
  task clear: :environment do
    Order.destroy_all
  end

end
