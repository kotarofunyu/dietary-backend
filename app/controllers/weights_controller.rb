# frozen_string_literal: true

class WeightsController < ApplicationController
  before_action :set_weight, only: %i[show update destroy]

  def index
    weights = Weight.all.select(:id, :date, :weight, :comment)
    render json: weights if weights
  end

  def show
    render json: @weight
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
    @weight.destroy
  end

  private

  def set_weight
    @weight = Weight.find_by(id: params[:id])
  end

  def weight_params
    params.require(:weight).permit(:weight, :date, :comment)
  end
end
