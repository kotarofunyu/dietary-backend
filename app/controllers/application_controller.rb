class ApplicationController < ActionController::API
  include Firebase::Auth::Authenticable
  include ActionController::Cookies

  # before_action :authenticate_user

  before_action :require_login
  before_action :check_existece_of_custom_header

  private

  def current_user
    @current_user ||= User.find(payload['user_id'])
  end

  def require_login
    @current_user = User.find_by(id: session[:user_id])
    p "ログイン中のユーザー：#{@current_user}"
    return if @current_user

    render json: { error: 'Unauthorized' }, status: :unauthorized
  end

  def check_existece_of_custom_header
    return if request.headers["HTTP_CUSTOM_HEADER_ELEMENT"] == "kochandayo"

    render json: { error: 'forbidden' }, status: :forbidden
  end

end
