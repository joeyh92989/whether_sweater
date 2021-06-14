class BookFacade
  def self.book_search(location)
    coord = LatLong.new(MapQuestService.coordinates(location))
    binding.pry
    forecast = Forecast.new(OpenWeatherService.one_call(coord.lat, coord.long))
    binding.pry
    books= OpenLibraryService.search(location)
    binding.pry
  end

  def self.create_book_array(books)
    binding.pry
    books[:docs].map do |book|
      {
        isbn: book[:isbn],
        title: book[:title],
        publisher: book[:publisher]
      }
    end
  end
end
