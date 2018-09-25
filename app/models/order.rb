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

class Order < ApplicationRecord
  include AASM
  validates :name, :email, :full_address, :cc_num, :phone, :make, :model, :milage, :price, presence: true

  has_many :notes, dependent: :destroy

  aasm do # default column: aasm_state
    state :created, :initial => true
    state :ready_for_payment
    state :payment_processed
    state :shipped
    state :failed

    event :finance_approve do
      transitions :from => :created, :to => :ready_for_payment
    end

    event :make_payment do
      transitions :from => :ready_for_payment, :to => :payment_processed
    end

    event :ship do
      transitions :from => :payment_processed, :to => :shipped
    end

    event :fail do
      transitions :to => :failed
    end

  end

  def used_car?
    milage.to_i > 0  
  end

  def add_note(text)
    Note.create(body: text, order_id: self.id)
  end

  def all_notes
    #notes.map{|n| n.body}.join(', ')
    notes.map(&:body).join(', ')
  end

end
