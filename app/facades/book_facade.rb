class BookFacade
  def self.book_search(location, quantity)
    coord = LatLong.new(MapQuestService.coordinates(location))
    forecast = Forecast.new(OpenWeatherService.one_call(coord.lat, coord.long))
    books= OpenLibraryService.search(location)
    book_array = BookFacade.create_book_array(books, quantity)
    Books.new(coord,forecast,book_array, books[:numFound])
  end

  def self.create_book_array(books, quantity = 100)
     collection = books[:docs].map do |book|
      {
        isbn: book[:isbn],
        title: book[:title],
        publisher: book[:publisher]
      }
    end
    collection.take(quantity)
  end
end
