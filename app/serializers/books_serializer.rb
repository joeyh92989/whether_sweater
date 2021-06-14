class BooksSerializer
  include FastJsonapi::ObjectSerializer
  set_id { "null" }

  attributes :destination, :forecast, :total_books_found, :books
end
