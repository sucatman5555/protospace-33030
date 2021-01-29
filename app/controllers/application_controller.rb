class ApplicationController < ActionController::Base
  # Basic認証の実装01
  before_action :basic_auth
  # //Basic認証の実装01
  
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

  # Basic認証の実装02
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      # 環境変数を読み込む記述に変更
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end
  # //Basic認証の実装02
end
