require 'rails_helper'

RSpec.describe 'Unsplash Service' do
  describe 'return an image of city' do
    it 'returns url to an image of a city', :vcr do
      results = UnsplashService.city_image('denver,co')
      expect(results).to be_a(Hash)
      expect(results[:results].count).to eq(1)
      expect(results[:results].first).to have_key(:description)
      expect(results[:results].first[:urls]).to have_key(:full)
      expect(results[:results].first[:user][:links]).to have_key(:html)
      expect(results[:results].first[:user]).to have_key(:username)
    end
  end
end
