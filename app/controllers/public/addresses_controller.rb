class Public::AddressesController < ApplicationController

  def index
    @addresses = Address.where(customer_id: current_customer.id)
  end

  def create
    address = Address.new(address_params)
    address.customer_id = current_customer.id
    if address.save
      redirect_to addresses_path
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to addresses_path
    end
  end

  def destroy
    @address = Address.find(params[:id])
    if @address.destroy
      redirect_to addresses_path
    end
  end

  private

  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end
end
