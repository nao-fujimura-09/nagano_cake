class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      # if @customer.update(is_active: false) 
      #   @customer.update(is_deleted: false)
      # end
      redirect_to customers_path(current_customer)
    else
      render :edit
    end
  end

  def comfirm
    @customer = current_customer
  end
  
  def withdrawal
    @customer = current_customer
    # @customer = Customer.find_by(email: params[:email])
    if @customer.update(is_deleted: true)
      flash[:alert] = "本当に退会してもよろしいですか？"
      # @customer.is_active = true
    end
    reset_session
    redirect_to root_path
  end

  private
  
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :post_code, :address, :telephone_number, :email, :is_active, :is_deleted)
  end
end
