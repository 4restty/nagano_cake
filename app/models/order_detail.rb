class OrderDetail < ApplicationRecord
  enum order_status: {
    not_startable: 0,
    waiting_for_production: 1,
    in_production: 2,
    production_completed: 3
  }
  belongs_to :order
  belongs_to :item
end
