class Public::OrdersController < ApplicationController

  def index
  end

  def new
    @order = Order.new
  end

  def show
    @order = Order.find(params[:id])
    @postage = 800
  end

  def confirm
    @order = Order.new(order_params)
    @postage = 800
    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:select_address] == "2"
    end
  end

  def determine
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    postage = 800
    @order.postage = postage
    @order.payment = current_customer.cart_total + @order.postage
    @order.save
    current_customer.cart_items.all.each do |cart_item|
      OrderDetail.create!(item_id: cart_item.item_id, amount: cart_item.amount, price: cart_item.subtotal, order_id: @order.id)
    end
    current_customer.cart_items.destroy_all
    redirect_to thanks_orders_path
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end
end
