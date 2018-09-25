class ProcessPaymentJob < ApplicationJob
  queue_as :process_payment

  def perform(order_id)
    order = Order.find(order_id)
    PaymentService.new(order: order).process_payment
  end

  def self.schedule_payments
    Order.ready_for_payment.each do |o|
       ProcessPaymentJob.perform_later(o.id)
    end
  end
end