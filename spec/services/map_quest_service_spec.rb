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
  describe 'return directions' do
    describe 'happy path' do
      it 'can return directions for a trip if provided valid start & end', :vcr do
        results = MapQuestService.directions('denver,co', 'pueblo,co')
        expect(results).to be_a(Hash)
        expect(results).to have_key(:route)
        expect(results[:route]).to have_key(:formattedTime)
        expect(results[:route]).to have_key(:realTime)
        expect(results[:route][:formattedTime]).to be_a(String)
        expect(results[:route][:realTime]).to be_a(Integer)
      end
    end
    describe 'sad path' do
      it 'can return an error when the route selected is not viable', :vcr do
        results = MapQuestService.directions('denver,co', 'london')
        expect(results).to be_a(Hash)
        expect(results).to have_key(:route)
        expect(results[:route]).to have_key(:routeError)
        expect(results[:info]).to have_key(:messages)

      end
    end
  end
end
