require 'rails_helper'

describe 'Background Image' do
  describe 'Background Index' do
    describe 'Happy Path' do
      it 'send an image detail over json when a valid location is sent', :vcr do

        get '/api/v1/backgrounds', params: {location:"denver,co" }
        background = JSON.parse(response.body, symbolize_names: true)
        expect(response).to be_successful
        expect(background[:data][:attributes].count).to eq(1)
        expect(background[:data][:attributes]).to have_key(:image)
        expect(background[:data][:attributes][:image]).to have_key(:description)
        expect(background[:data][:attributes][:image]).to have_key(:image_url)
        expect(background[:data][:attributes][:image]).to have_key(:attribution)
        expect(background[:data][:attributes][:image][:attribution]).to have_key(:source)
        expect(background[:data][:attributes][:image][:attribution]).to have_key(:author)
        expect(background[:data][:attributes][:image][:attribution]).to have_key(:portfolio)
      end
    end
    describe 'Sad Path' do
      xit 'sends an error when an invalid location is sent', :vcr do

        get '/api/v1/forecast', params: {location:"" }
        forecast = JSON.parse(response.body, symbolize_names: true)
        expect(response.status).to eq(404)
        expect(forecast).to be_a Hash
        expect(forecast).to have_key(:errors)
        expect(forecast[:errors]).to eq("Location not found")
      end
    end
  end
end