require 'rails_helper'

RSpec.describe 'Open Weather Service' do
  describe 'return weather info' do
    it 'returns forecast based on lat and long', :vcr do
      results = OpenWeatherService.one_call('39.7385', '-104.9849')
      expect(results).to be_a(Hash)
      expect(results).to have_key(:current)
      expect(results).to have_key(:hourly)
      expect(results).to have_key(:daily)
      expect(results).not_to have_key(:minutely)
      expect(results).not_to have_key(:alerts)
    end
  end
end
