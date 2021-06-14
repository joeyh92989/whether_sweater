class Api::V1::BackgroundController < ApplicationController
  def index
    background = UnsplashService.city_image(params[:location])
    poro = Background.new(background)
    render json: ImageSerializer.new(poro)
  end
end
