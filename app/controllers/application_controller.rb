class ApplicationController < ActionController::Base
  # 2020/12/25 add S.Shimada application_controllerに、emailとpassword以外の値も保存できるように追記する
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:profile])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:occupation])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:position])
  end
  # //2020/12/25 add S.Shimada application_controllerに、emailとpassword以外の値も保存できるように追記する
end
