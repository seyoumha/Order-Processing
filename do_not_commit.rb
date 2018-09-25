rails g model order order_id name email full_address cc_num phone make model milage price:decimal 

OrderImporter.new(file_name: 'Orders-2018-09-15151537.csv').process