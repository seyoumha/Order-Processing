namespace :finance do
  desc "Process all payments that are ready to go"
  task process_payments: :environment do
    ProcessPaymentJob.schedule_payments
  end

end
