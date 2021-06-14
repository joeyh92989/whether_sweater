class UnsplashService
  def self.conn
    Faraday.new('https://api.unsplash.com')
  end

  def self.city_image(location)
    response = conn.get('/search/photos', {
                          client_id: ENV['unsplash'],
                          query: location,
                          per_page: 1
                        })
    JSON.parse(response.body, symbolize_names: true)
  end
end
#attr unsplash
#attribute link to photographers link
#attribute