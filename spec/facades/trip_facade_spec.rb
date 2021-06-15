require 'rails_helper'

RSpec.describe 'Trip Facade' do
  it 'returns a weather hash similar to time of arrival', :vcr do
    arrival_time = Time.now + 100950
    response = TripFacade.get_weather_at_arrival("New York", arrival_time)
    expect(response).to be_a(Hash)
    expect(response).to have_key(:temperature)
    expect(response[:temperature]).to be_a(Float)
    expect(response).to have_key(:conditions)
    expect(response[:conditions]).to be_a(String)
  end
end
