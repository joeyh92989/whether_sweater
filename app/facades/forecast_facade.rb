class ForecastFacade
  def self.forecast(location)
    coord = LatLong.new(MapQuestService.coordinates(location))

    json = OpenWeatherService.one_call(coord.lat, coord.long)
    Forecast.new(json)
  end
end
