class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :rememberable, :validatable

  has_many :orders, dependent: :destroy
  has_many :cart_items, dependent: :destroy

  def cart_total
    total = 0
    cart_items.each do |cart_item|
      total += cart_item.subtotal
    end
    return total
  end

  def active_for_authentication?
    super && is_active
  end
end
