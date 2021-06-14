class BookFacade
  def self.book_search(location, quantity = 100)
    coord = LatLong.new(MapQuestService.coordinates(location))
    forecast = Forecast.new(OpenWeatherService.one_call(coord.lat, coord.long))
    books= OpenLibraryService.search(location)
    book_array = BookFacade.create_book_array(books, quantity)
    Books.new(coord,forecast,book_array, books[:numFound])
  rescue NoMethodError
    {errors: "No results found for location, please use another location"}
  end

  def self.create_book_array(books, quantity)
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
