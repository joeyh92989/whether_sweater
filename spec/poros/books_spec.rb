require 'rails_helper'

RSpec.describe 'Books' do
  describe 'it encapsulates and returns books object' do
    it 'shows Books attributes', :vcr do
      coord = LatLong.new(MapQuestService.coordinates('denver,co'))
      forecast = Forecast.new(OpenWeatherService.one_call(coord.lat, coord.long))
      books = OpenLibraryService.search('denver,co')
      book_array = BookFacade.create_book_array(books, 3)
      books = Books.new(coord, forecast, book_array, books[:numFound])
      expect(books).to be_a(Books)
      expect(books.destination).to eq('denver,co')
      expect(books.destination).to be_a(String)
      expect(books.forecast).to be_a(Hash)
      expect(books.forecast[:summary]).to be_a(String)
      expect(books.forecast[:summary]).to eq("clear sky")
      expect(books.forecast[:temperature]).to eq("81.05 F")
      expect(books.forecast[:temperature]).to be_a(String)
      expect(books.total_books_found).to be_a(Integer)
      expect(books.total_books_found).to eq(35992)
      expect(books.books).to be_a(Array)
      expect(books.books.count).to eq(3)
    end
  end
end