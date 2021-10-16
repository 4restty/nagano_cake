class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def unsubscribe
    @customer = current_customer
  end

  def withdraw
    @customer = current_customer
    if @customer.update(is_active: false)
      redirect_to root_path
    end
  end
end
