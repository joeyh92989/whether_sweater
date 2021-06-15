class TripFacade
  def self.get_weather_at_arrival(location, time)
    coord = LatLong.new(MapQuestService.coordinates(location))
    forecast = OpenWeatherService.one_call(coord.lat, coord.long)
    closest_weather = forecast[:hourly].find_all{|hour| hour[:dt]< time.to_i}.sort_by(&:first).last
    {temperature: closest_weather[:temp], conditions: closest_weather[:weather][0][:description]}

  end
end
