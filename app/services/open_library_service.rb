class OpenLibraryService
  def self.conn
    Faraday.new('http://openlibrary.org')
  end

  def self.search(query)
    response = conn.get('/search.json', {
                          q: query
                        })
    JSON.parse(response.body, symbolize_names: true)
  end
end
