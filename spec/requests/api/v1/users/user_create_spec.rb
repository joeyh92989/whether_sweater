require 'rails_helper'

describe 'User Create' do
  describe 'User Create' do
    describe 'Happy Path' do
      it 'send a user when succesful creation occurs', :vcr do

        post '/api/v1/users', params: {
          "email": "whatever@example.com",
          "password": "password",
          "password_confirmation": "password" }
        user = JSON.parse(response.body, symbolize_names: true)
        expect(response).to be_successful
        expect(response.status).to eq(201)
        expect(user[:data][:attributes]).to have_key(:email)
        expect(user[:data][:attributes]).to have_key(:api_key)
        expect(user[:data][:attributes][:email]).to eq("whatever@example.com")
        expect(User.count).to eq(1)
      end
    end
    describe 'Sad Path' do
      it 'sends an error when params sent are invalid', :vcr do

        post '/api/v1/users', params: {
          "email": "whatever@example.com",
          "password": "password",
          "password_confirmation": "password2" }
        user = JSON.parse(response.body, symbolize_names: true)
        expect(response.status).to eq(400)
        expect(user).to be_a Hash
        expect(user).to have_key(:errors)
        expect(user[:errors].first).to eq("Password confirmation doesn't match Password")
      end
    end
  end
end