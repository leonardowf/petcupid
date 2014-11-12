class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!, unless: :devise_controller?

  respond_to :html, :json

  def after_sign_in_path_for(resource_or_scope)
    user_shelter = current_user.shelter
    "/shelters/#{user_shelter.id}"
  end

end
