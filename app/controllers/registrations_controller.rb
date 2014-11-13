class RegistrationsController < Devise::RegistrationsController

  def after_sign_up_path_for(resource)
    "/shelters/#{resource.shelter.id}/edit"
  end

  private

  def sign_up_params
    allow = [:email, :password, :password_confirmation, shelter_attributes: [:name, :address]]
    params.require(resource_name).permit(allow)
  end

end