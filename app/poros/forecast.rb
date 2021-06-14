class Forecast
  attr_reader :current_weather,
              :daily_weather,
              :hourly_weather

  def initialize(weather_info)
    @current_weather = create_current(weather_info[:current])
    @daily_weather = create_daily(weather_info[:daily].take(5))
    @hourly_weather = create_hourly(weather_info[:hourly].take(8))
  end

  def create_current(args)
    current_weather = {}
    current_weather[:datetime] = DateTime.strptime((args[:dt]).to_s, '%s')
    current_weather[:sunrise] = DateTime.strptime((args[:sunrise]).to_s, '%s')
    current_weather[:sunset] = DateTime.strptime((args[:sunset]).to_s, '%s')
    current_weather[:temperature] = args[:temp]
    current_weather[:feels_like] = args[:feels_like]
    current_weather[:humidity] = args[:humidity]
    current_weather[:uvi] = args[:uvi]
    current_weather[:visibility] = args[:visibility]
    current_weather[:conditions] = args[:weather][0][:description]
    current_weather[:icon] = args[:weather][0][:icon]
    current_weather
  end

  def create_daily(args)
    daily_array = []

    args.each do |hash|
      day = {}
      day[:datetime] = DateTime.strptime((hash[:dt]).to_s, '%s').strftime('%m/%d/%Y')
      day[:sunrise] = DateTime.strptime((hash[:sunrise]).to_s, '%s')
      day[:sunset] = DateTime.strptime((hash[:sunset]).to_s, '%s')
      day[:max_temp] = hash[:temp][:max]
      day[:min_temp] = hash[:temp][:min]
      day[:conditions] = hash[:weather][0][:description]
      day[:icon] = hash[:weather][0][:icon]
      daily_array << day
    end
    daily_array
  end

  def create_hourly(args)
    hourly_array = []

    args.each do |hash|
      hour = {}
      hour[:datetime] = DateTime.strptime((hash[:dt]).to_s, '%s').strftime('%I:%M:%S %p')
      hour[:temperature] = hash[:temp]
      hour[:conditions] = hash[:weather][0][:description]
      hour[:icon] = hash[:weather][0][:icon]
      hourly_array << hour
    end
    hourly_array
  end
end
