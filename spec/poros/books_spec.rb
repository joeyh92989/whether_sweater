require 'rails_helper'

RSpec.describe 'Books' do
  describe 'it encapsulates and returns books object' do
    it 'shows Books attributes', :vcr do
      coord = LatLong.new(MapQuestService.coordinates('denver,co'))
      forecast = Forecast.new(OpenWeatherService.one_call(coord.lat, coord.long))
      books = OpenLibraryService.search('denver,co')
      book_array = BookFacade.create_book_array(books, 3)
      books = Books.new(coord, forecast, book_array, books[:numFound])
      binding.pry
      expect(books).to be_a(Books)
      expect(books.destination).to eq('denver,co')
      expect(books.destination).to eq('denver,co')
    end
  end
end