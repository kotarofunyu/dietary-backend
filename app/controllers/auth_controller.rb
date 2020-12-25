
class AuthController < ApplicationController
  skip_before_action :authenticate_user

  def create
    binding.pry
    FirebaseIdToken::Certificates.request
    raise ArgumentError, 'BadRequest Parameter' if payload.blank?

    if params[:user][:name].present?
      @user = User.create!(uid: payload['user_id'], name: params[:user][:name], email: params[:user][:email])
      if @user
        render json: @user, status: :ok
      else
        render json: @user.errors, stauts: :unprocessable_entity
      end
    else
      @user = User.find_by(uid: payload['user_id'], email: params[:user][:email])
      if @user
        render json: @user, status: :ok
      else
        render json: @user.errors, stauts: :unprocessable_entity
      end
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
