# frozen_string_literal: true

class MonthlyWeightsController < ApplicationController

  def show
    month = Time.new(Time.now.year, params[:month]).all_month
    @weights = Weight.where(date: month)
    if @weights.present?
      render json: @weights = Weight.where(date: month)
    else
      render status: 404, json: { status: 404, message: 'Not Found' }
    end
  end

end
