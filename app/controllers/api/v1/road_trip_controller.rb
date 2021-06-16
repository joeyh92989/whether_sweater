class Api::V1::RoadTripController < ApplicationController
  before_action :set_user

  def create
    if @user.nil?
      render json: { errors: 'Api Key invalid' }, status: :unauthorized
    else
      trip = TripFacade.create_trip(params[:origin], params[:destination])
      render json: RoadtripSerializer.new(trip)
    end
  end

  private

  def set_user
    @user = User.find_by(api_key: params[:api_key])
  end
end
