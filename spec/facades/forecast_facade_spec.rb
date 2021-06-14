require 'rails_helper'

RSpec.describe 'ForecastFacade' do
  it 'returns a forecast object', :vcr do
    response = ForecastFacade.forecast("Denver,co")
    expect(response).to be_a(Forecast)
    expect(response.current_weather).to be_a(Hash)
    expect(response.daily_weather).to be_a(Array)
    expect(response.daily_weather.first).to be_a(Hash)
    expect(response.hourly_weather.first).to be_a(Hash)
    expect(response.hourly_weather).to be_a(Array)
  end
end
