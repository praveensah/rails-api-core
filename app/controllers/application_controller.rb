class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  include DeviseTokenAuth::Concerns::SetUserByToken

  # check_authorization

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name,
                                                               :confirm_success_url,
                                                               :referred_by,
                                                               :mobile_number,
                                                               :role

    )}
  end
end
