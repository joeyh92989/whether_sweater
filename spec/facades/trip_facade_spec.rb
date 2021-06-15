require 'rails_helper'

RSpec.describe 'Trip Facade' do
  describe 'it can create a trip object' do
    describe 'happy path' do
      it 'returns a weather hash similar to time of arrival', :vcr do
        arrival_time = Time.now + 100_950
        response = TripFacade.get_weather_at_arrival('New York', arrival_time)
        expect(response).to be_a(Hash)
        expect(response).to have_key(:temperature)
        expect(response[:temperature]).to be_a(Float)
        expect(response).to have_key(:conditions)
        expect(response[:conditions]).to be_a(String)
      end

      it 'returns a Roadtrip poro based on trip data', :vcr do
        response = TripFacade.create_trip('Denver,CO', 'New York, NY')
        expect(response).to be_a(Roadtrip)
        expect(response.end_city).to eq('New York, NY')
        expect(response.start_city).to eq('Denver,CO')
        expect(response.travel_time).to be_a(String)
        expect(response.weather_at_eta).to be_a(Hash)
      end
    end
    describe 'sad path'do
      it 'returns impossible travel time and no weather when travel is not viable', :vcr do 
        response = TripFacade.create_trip('Denver,CO', 'London, England')
        expect(response).to be_a(Roadtrip)
        expect(response.end_city).to eq('London, England')
        expect(response.start_city).to eq('Denver,CO')
        expect(response.travel_time).to eq("impossible")
        expect(response.weather_at_eta.empty?).to eq(true)
      end
    end
  end
end
