class SessionController < ApplicationController
  skip_before_action :authenticate_user
  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      payload = { message: 'Successfully Logged in!', name: user.name }
    else
      payload = { errors: ['Log in failed'] }
    end
    render json: payload
  end
end
