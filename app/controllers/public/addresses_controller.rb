class Public::AddressesController < ApplicationController
  
  def index
    @addresses = current_customer.addresses.all
    @address = Address.new
  end
  
  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    @address.save
    redirect_to addresses_path
  end

  def edit
    @address = Address.find(params[:id])
  end
  
  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to addresses_path
  end
  
  def destroy
    @address = Address.find(params[:id]).destroy
    redirect_to addresses_path
  end
  
  public
  
  def address_params
    params.require(:address).permit(:customer_id, :name, :postal_code, :address)
  end
  
end
