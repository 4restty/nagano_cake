class Item < ApplicationRecord
  belongs_to :genre
  attachment :image
  has_many :order_detail, dependent: :destroy
  has_many :cart_items, dependent: :destroy

  def with_tax_price
    (price * 1.1).floor
  end

end
