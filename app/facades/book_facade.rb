class BookFacade
  def self.book_search(location)
    coord = LatLong.new(MapQuestService.coordinates(location))
    binding.pry
    forecast = Forecast.new(OpenWeatherService.one_call(coord.lat, coord.long))
    binding.pry
  end
end
