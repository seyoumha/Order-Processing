class ClientOrder

  def initialize data
    @data = data
  end
  # name,email,full_address,cc_num,phone,make,model,milage,price
  def to_order
    {
      name: @data[0],
      email: @data[1],
      full_address: @data[2],
      cc_num: @data[3],
      phone: @data[4],
      make: @data[5],
      model: @data[6],
      milage: @data[7],
      price: @data[8]

    }
  end
end
