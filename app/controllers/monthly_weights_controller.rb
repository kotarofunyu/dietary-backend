# frozen_string_literal: true

class MonthlyWeightsController < ApplicationController
  # before_action :user_exists?
  # before_action :set_user

  def show
    month = Time.new(Time.now.year, params[:month]).all_month

    @weights = Weight.where(date: month)
    if @weights.present?
      render json: @weights
    else
      show_not_found
    end
  end

  private

  def show_not_found
    render status: 404, json: { status:404, message: 'Not Found' }
  end

end
