class Order < ApplicationRecord
  enum order_status: {
    waiting_for_payment: 0,
    payment_confirmation: 1,
    in_production: 2,
    preparing_for_shipment: 3,
    shipped: 4
  }
  enum payment_method: {
    credit_card: 0,
    bank_transfer: 1
  }
  has_many :order_details, dependent: :destroy
  belongs_to :customer
end
