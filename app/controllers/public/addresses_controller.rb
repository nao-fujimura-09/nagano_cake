class Public::AddressesController < ApplicationController
  def index
  end
  
  def create
    @address = Adress.new(params[:id])
    @address.customer_id = current_customer.id
    @address.save(address_params)
    redirect_to orders_comfirm_path
  end

  def edit
  end
  
  public
  
  def address_params
    params.require(:address).permit.(:customer_id, :name, :postal_code, :address)
  end
  
end
