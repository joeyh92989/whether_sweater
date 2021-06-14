class Books
  attr_reader :destination,
              :forecast,
              :total_books_found,
              :books

  def initialize(coordinates, forecast, book_collection, total_books)
    @destination = coordinates.destination
    @forecast = {
      summary: forecast.current_weather[:conditions],
      temperature: "#{forecast.current_weather[:temperature]} F"
    }
    @total_books_found = total_books
    @books = book_collection
  end
end
