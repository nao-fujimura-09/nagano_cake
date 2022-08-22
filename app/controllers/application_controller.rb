class ApplicationController < ActionController::Base

# before_action :configure_permitted_parameters, if: :devise_controller?

#   def after_sign_in_path_for(resource)
#     case resource
#       when Admin
#         admin_items_path
#       when Customer
#         root_path
#     end
#   end
  
#   def after_sign_out_path_for(resource_or_scope)
#     if resource_or_scope == :admin
#         root_path
#     elsif resource_or_scope == customers
#         new_admin_session_path
#     else
#         root_path
#     end
#   end
end
