class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :configure_account_update_params, only: [:update]
    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname])
    end

    def configure_account_update_params
        devise_parameter_sanitizer.permit(:account_update, keys: [:image, :firstname, :lastname, :password, :password_confirmation, :current_password])
    end
end
