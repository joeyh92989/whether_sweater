class Books
  attr_reader :destination,
              :forecast,
              :total_books_found,
              :books

  def initialize(coordinates, forecast, book_collection, total_books)
    binding.pry
    @destination = coordinates.destination
    @forecast = nil
    @total_books_found = nil
    @books = nil
  end
end
