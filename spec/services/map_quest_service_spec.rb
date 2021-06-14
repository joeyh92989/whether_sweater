require 'rails_helper'

RSpec.describe 'Map Quest Service' do
  describe 'return coordinates' do
    describe 'happy path' do
      it 'returns lat & long from a city name', :vcr do
        results = MapQuestService.coordinates('Denver,CO')
        expect(results).to be_a(Hash)
        expect(results).to have_key(:results)
        expect(results[:results].first).to have_key(:locations)
        expect(results[:results].first[:locations].first).to have_key(:latLng)
        expect(results[:results].first[:locations].first[:latLng].count).to eq(2)
      end
    end
    describe 'sad path' do
      xit 'returns error if no location provided', :vcr do 
        results = MapQuestService.coordinates('')

      end
    end
  end
end
