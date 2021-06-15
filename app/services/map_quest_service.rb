class MapQuestService
  def self.conn
    Faraday.new('http://www.mapquestapi.com')
  end

  def self.coordinates(name)
    response = conn.get('/geocoding/v1/address', {
                          key: ENV['map_quest'],
                          location: name
                        })
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.directions(from, to)
    response = conn.get('/directions/v2/route', {
                          key: ENV['map_quest'],
                          from: from,
                          to: to
                        })
    JSON.parse(response.body, symbolize_names: true)
  end
end
