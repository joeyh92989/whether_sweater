require 'rails_helper'

RSpec.describe 'Open Library Service' do
  describe 'return book search results' do
    it 'returns books based on a search parameter', :vcr do
      results = OpenLibraryService.search('denver,co')
      expect(results).to be_a(Hash)
      expect(results).to have_key(:numFound)
      expect(results[:numFound]).to eq(35992)
      expect(results).to have_key(:docs)
      expect(results[:docs][0]).to have_key(:isbn)
      expect(results[:docs][0]).to have_key(:publisher)
      expect(results[:docs][0]).to have_key(:title)
      expect(results[:docs][0]).to have_key(:title)

    end
  end
end
