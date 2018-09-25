require 'rest-client'
class PaymentService

  def initialize args = {}
    @order = args[:order]
  end

  def process_payment
    # make http call to cc service 
    #if approved, order.make_payment!
    # else order.fail! add err msg from api to notes
    headers = {}
    payload = {}
    response = RestClient.post(CC_SERVICE_URL, payload, headers)
    
    if response.code == 200
      data = JSON.parse(response)
      if data['success']
        @order.make_payment!
      else
        @order.add_note("CC API: #{data['errors']}")
        @order.fail!
      end
    else
      @order.fail!
      @order.add_note("Network/API error #{response.code}")
    end

  rescue Exception => e
    @order.add_note("Network/API error #{response.code}")
  end

end