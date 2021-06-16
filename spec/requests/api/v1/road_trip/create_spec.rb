require 'rails_helper'

describe 'Road Trip Create' do
  describe 'Road Trip Create' do
    describe 'Happy Path' do
      it 'send a road trip when valid user is sent with origin and destination', :vcr do
        user = User.create!(email: 'whatever@example.com', password_digest: 'abc', api_key: 'doTPpdBC5gRdSxh2yqsBAWxj')
        post '/api/v1/road_trip', params: {
          "origin": 'Denver,CO',
          "destination": 'Pueblo,CO',
          "api_key": 'doTPpdBC5gRdSxh2yqsBAWxj'
        }
        road_trip = JSON.parse(response.body, symbolize_names: true)
        expect(response).to be_successful
        expect(response.status).to eq(200)
        expect(road_trip[:data][:attributes]).to have_key(:start_city)
        expect(road_trip[:data][:attributes][:start_city]).to be_a(String)
        expect(road_trip[:data][:attributes]).to have_key(:end_city)
        expect(road_trip[:data][:attributes][:end_city]).to be_a(String)
        expect(road_trip[:data][:attributes]).to have_key(:travel_time)
        expect(road_trip[:data][:attributes][:travel_time]).to be_a(String)
        expect(road_trip[:data][:attributes]).to have_key(:weather_at_eta)
        expect(road_trip[:data][:attributes][:weather_at_eta]).to be_a(Hash)
        expect(road_trip[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
        expect(road_trip[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
      end

      it 'send a road trip with impossible travel time and no weather if trip is not valid', :vcr do
        user = User.create!(email: 'whatever@example.com', password_digest: 'abc', api_key: 'doTPpdBC5gRdSxh2yqsBAWxj')
        post '/api/v1/road_trip', params: {
          "origin": 'Denver,CO',
          "destination": 'London, England',
          "api_key": 'doTPpdBC5gRdSxh2yqsBAWxj'
        }
        road_trip = JSON.parse(response.body, symbolize_names: true)
        expect(response).to be_successful
        expect(response.status).to eq(200)
        expect(road_trip[:data][:attributes]).to have_key(:start_city)
        expect(road_trip[:data][:attributes][:start_city]).to be_a(String)
        expect(road_trip[:data][:attributes]).to have_key(:end_city)
        expect(road_trip[:data][:attributes][:end_city]).to be_a(String)
        expect(road_trip[:data][:attributes]).to have_key(:travel_time)
        expect(road_trip[:data][:attributes][:travel_time]).to eq('impossible')
        expect(road_trip[:data][:attributes]).to have_key(:weather_at_eta)
        expect(road_trip[:data][:attributes][:weather_at_eta]).to be_a(Hash)
        expect(road_trip[:data][:attributes][:weather_at_eta].empty?).to eq(true)
      end
    end

    describe 'Sad Path' do
      it 'sends an error when api key is invalid', :vcr do
        post '/api/v1/road_trip', params: {
          "origin": 'Denver,CO',
          "destination": 'Pueblo,CO',
          "api_key": 'doTPpdBC5gRdSxh2yqsBAWxj'
        }
        road_trip = JSON.parse(response.body, symbolize_names: true)
        expect(response.status).to eq(401)
        expect(road_trip).to be_a Hash
        expect(road_trip[:errors]).to eq('Api Key invalid')
      end
    end
  end
end
