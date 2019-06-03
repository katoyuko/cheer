class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  # ログイン後のリダイレクトをログイン前のページ指定
  before_action :store_current_location, unless: :devise_controller?

  protected

  #nameのデータ操作を許可
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  private

  def store_current_location
    store_location_for(:user, request.url)
  end

end
