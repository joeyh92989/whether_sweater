class TripFacade
  def self.create_trip(origin, destination)
    time = MapQuestService.directions(origin, destination)
    if time[:info][:statuscode] == 402 || time[:route][:formattedTime] == "00:00:00"
      time_clean = 'impossible'
      weather = {}
    else
      binding.pry
      time_clean = time[:route][:formattedTime]
      time_unix = Time.now + (time[:route][:realTime])
      weather = get_weather_at_arrival(destination, time_unix)
    end
    Roadtrip.new(origin, destination, time_clean, weather)
  end

  def self.get_weather_at_arrival(location, travel_time)
    coord = LatLong.new(MapQuestService.coordinates(location))
    forecast = OpenWeatherService.one_call(coord.lat, coord.long)
    closest_weather = forecast[:hourly].find_all { |hour| hour[:dt] < travel_time.to_i }.max_by(&:first)
    { temperature: closest_weather[:temp], conditions: closest_weather[:weather][0][:description] }
  end
end
