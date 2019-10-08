class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?

    def show
    end

    private
        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :address_1, :address_2, :city, :state, :zip_code])
        end
end