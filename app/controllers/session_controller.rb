class SessionController < ApplicationController
  skip_before_action :require_login
  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      payload = { message: 'Successfully Logged in!', user: { id: user.id, name: user.name } }
      render json: payload, status: :ok
    else
      payload = { errors: ['Log in failed'] }
      render json: payload, status: :forbidden
    end
  end

  def destroy
    p session[:user_id]
    session[:user_id] = nil
    render json: { message: 'Logged out.', user: nil }, status: :ok
  end
end
