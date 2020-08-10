# frozen_string_literal: true

class WeightsController < ApplicationController
  before_action :set_weight, only: %i[show update destroy]

  # GET /weights
  def index
    # @weights = Weight.all

    # render json: @weights
    render json: @weights = Weight.all.to_json(only: %i[date weight comment])
  end

  # GET /weights/1
  def show
    render json: @weight
  end

  # POST /weights
  def create
    # @weight = Weight.new(weight_params)

    # if @weight.save
    #   render json: @weight, status: :created, location: @weight
    # else
    #   render json: @weight.errors, status: :unprocessable_entity
    # end
    @weight = Weight.new(weight: params[:weight], date: params[:date], comment: params[:comment])
    if @weight.save
      render json: @weight, status: :created, location: @weight
    else
      render json: @weight.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /weights/1
  def update
    if @weight.update(weight_params)
      render json: @weight
    else
      render json: @weight.errors, status: :unprocessable_entity
    end
  end

  # DELETE /weights/1
  def destroy
    @weight.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_weight
    @weight = Weight.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def weight_params
    params.require(:weight).permit!(:weight, :date, :comment)
  end
end
