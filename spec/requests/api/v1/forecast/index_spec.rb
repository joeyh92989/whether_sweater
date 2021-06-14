require 'rails_helper'

describe 'Forecast' do
  describe 'Forecast Index' do
    describe 'Happy Path' do
      it 'send a weather forecast when sent a valid location', :vcr do

        get '/api/v1/forecast', params: {location:"Denver,Co" }
        forecast = JSON.parse(response.body, symbolize_names: true)
        expect(response).to be_successful
        expect(forecast[:data][:attributes].count).to eq(3)
        expect(forecast[:data][:attributes]).to have_key(:current_weather)
        expect(forecast[:data][:attributes][:current_weather].count).to eq(10)
        expect(forecast[:data][:attributes]).to have_key(:daily_weather)
        expect(forecast[:data][:attributes][:daily_weather].count).to eq(5)
        expect(forecast[:data][:attributes][:daily_weather][0].count).to eq(7)
        expect(forecast[:data][:attributes]).to have_key(:hourly_weather)
        expect(forecast[:data][:attributes][:hourly_weather].count).to eq(8)
        expect(forecast[:data][:attributes][:hourly_weather][0].count).to eq(4)
      end
    end
    describe 'Sad Path' do
      it 'sends an error when an invalid location is sent', :vcr do

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