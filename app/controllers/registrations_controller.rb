class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(
      :first_name,
      :last_name,
      :library_card_number,
      :address_1,
      :zip_code,
      :phone_number
    )
  end
end
