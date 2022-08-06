class ApplicationController < ActionController::Base
  def configure_permited_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :post_code, :address, :telephone_number, :is_active])
  end
end
