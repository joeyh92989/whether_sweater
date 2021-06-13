class OpenWeatherService
  def self.conn
    Faraday.new('https://api.openweathermap.org')
  end

  def self.one_call(lat, long)
    response = conn.get('/data/2.5/onecall', {
                          lat: lat,
                          lon: long,
                          exclude: 'minutely,alerts',
                          appid: ENV['open_weather']
                        })
    JSON.parse(response.body, symbolize_names: true)
  end
end
