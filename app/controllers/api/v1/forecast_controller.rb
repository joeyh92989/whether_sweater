class Api::V1::ForecastController < ApplicationController
  def index
    forecast = ForecastFacade.forecast(params[:location])
    render json: ForecastSerializer.new(forecast)
  rescue NoMethodError
    render json: {errors: "Location not found"}, status: :not_found
  end
end