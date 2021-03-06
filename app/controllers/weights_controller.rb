# frozen_string_literal: true

class WeightsController < ApplicationController
  before_action :set_weight, only: %i[update destroy]

  def index
    @weights = Weight.includes(:tags).where(user_id: @current_user.id).order(:date)
  end

  def create
    @weight = Weight.new(weight_params)
    if @weight.save
      render json: @weight, status: :created, location: @weight
    else
      render json: @weight.errors, status: :unprocessable_entity
    end
  end

  def update
    if @weight.update(weight_params)
      render json: @weight
    else
      render json: @weight.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @weight.destroy
      head :ok
    else
      head :bad_request
    end
  end

  private

  def set_weight
    @weight = Weight.find_by(id: params[:id], user_id: @current_user.id)
  end

  def weight_params
    params.require(:weight).permit(:weight, :date, :comment, tag_ids: []).merge(user_id: @current_user.id)
  end
end
