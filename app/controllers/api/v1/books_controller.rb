class Api::V1::BooksController < ApplicationController
  def search
    books = BookFacade.book_search(params[:location], params[:quantity].to_i)
    render json: BooksSerializer.new(books)
  end
end