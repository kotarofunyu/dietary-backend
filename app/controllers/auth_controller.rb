
class AuthController < ApplicationController
  skip_before_action :authenticate_user

  def create
    FirebaseIdToken::Certificates.request
    raise ArgumentError, 'BadRequest Parameter' if payload.blank?

    @user = User.find_or_create_by(uid: payload['user_id'])
    if @user
      render json: @user, status: :ok
    else
      render json: @user.errors, stauts: :unprocessable_entity
    end
  end

  private

  def token_from_request_headers
    request.headers['Authorization']&.split&.last
  end

  def token
    params[:token] || token_from_request_headers
  end

  def payload
    @payload ||= FirebaseIdToken::Signature.verify token
  end

  # def sign_up_params
  #   params.require(:user).permit(:name, :email)
  # end
end
