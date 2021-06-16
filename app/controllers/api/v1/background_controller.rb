class Api::V1::BackgroundController < ApplicationController
  def index
    background = UnsplashService.city_image(params[:location])
    if background[:results] == []
      render json: {errors: "No Image Found"}, status: :not_found
    else
      poro = Background.new(background)
      render json: ImageSerializer.new(poro)
    end
  end
end
