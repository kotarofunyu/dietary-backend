class ApplicationController < ActionController::API
  include Firebase::Auth::Authenticable

  before_action :authenticate_user

  private

  def current_user
    @current_user ||= User.find(payload['user_id'])
  end

end
