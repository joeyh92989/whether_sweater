class Api::V1::BooksController < ApplicationController
  def search
    
    books = BookFacade.book_search(params[:location], params[:quantity].to_i)
    if books.is_a? Hash
      render json: books, status: :not_found
    else
    render json: BooksSerializer.new(books)
    end
  end
end