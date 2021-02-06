class ApplicationController < ActionController::API
  include Firebase::Auth::Authenticable
  include ActionController::Cookies

  # before_action :authenticate_user

  before_action :require_login

  private

  def current_user
    @current_user ||= User.find(payload['user_id'])
  end

  def require_login
    @current_user = User.find_by(id: session[:user_id])
    return if @current_user

    render json: { error: 'Unauthorized' }, status: :unauthorized
  end

end
