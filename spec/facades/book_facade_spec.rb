require 'rails_helper'

RSpec.describe 'Book Facade' do
  describe 'happy path' do
    it 'returns a Books object with all values, when no quantity provided', :vcr do
      response = BookFacade.book_search('denver,co')
      expect(response).to be_a(Books)
      expect(response.destination).to be_a(String)
      expect(response.forecast).to be_a(Hash)
      expect(response.total_books_found).to be_a(Integer)
      expect(response.books).to be_a(Array)
      expect(response.books.count).to eq(100)
    end

    it 'returns a Books object with all values at a specified quantity', :vcr do
      response = BookFacade.book_search('denver,co', 3)
      expect(response).to be_a(Books)
      expect(response.destination).to be_a(String)
      expect(response.forecast).to be_a(Hash)
      expect(response.total_books_found).to be_a(Integer)
      expect(response.books).to be_a(Array)
      expect(response.books.count).to eq(3)
    end

    it 'can return a collection of books with specific criteria', :vcr do
      books = OpenLibraryService.search('denver,co')
      array = BookFacade.create_book_array(books, 100)
      expect(array).to be_a(Array)
      expect(array.count).to eq(100)
      expect(array.first.count).to eq(3)
      expect(array.first).to be_a(Hash)
      expect(array.first).to have_key(:isbn)
      expect(array.first[:isbn]).to be_a(Array)
      expect(array.first).to have_key(:title)
      expect(array.first[:title]).to be_a(String)
      expect(array.first).to have_key(:publisher)
      expect(array.first[:publisher]).to be_a(Array)
    end

    it 'can return a collection of books based on specified quantity', :vcr do
      books = OpenLibraryService.search('denver,co')
      array = BookFacade.create_book_array(books, 5)
      expect(array).to be_a(Array)
      expect(array.count).to eq(5)
    end
  end
  describe 'sad path' do
    it "returns an error if location sent returns no result", :vcr do 
      response = BookFacade.book_search('')
      expect(response).to be_a(Hash)
      expect(response).to have_key(:errors)
      expect(response[:errors]).to eq("No results found for location, please use another location")

    end
  end
end
