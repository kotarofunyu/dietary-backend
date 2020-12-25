# frozen_string_literal: true

class MonthlyWeightsController < ApplicationController

  def show
    month = Time.new(Time.now.year, params[:month]).all_month
    @weights = Weight.where(date: month, user_id: current_user.id)
    if @weights.present?
      render json: @weights
    else
      render status: 404, json: { status:404, message: 'Not Found' }
    end
  end

end
