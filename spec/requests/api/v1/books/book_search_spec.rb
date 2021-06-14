require 'rails_helper'

describe 'Books Search' do
  describe 'Books Search' do
    describe 'Happy Path' do
      it 'sends a books json object if valid location is sent', :vcr do

        get '/api/v1/book-search', params: {location:"Denver,Co", quantity:5 }
        books = JSON.parse(response.body, symbolize_names: true)
        expect(response).to be_successful
        expect(books[:data][:attributes]).to have_key(:destination)
        expect(books[:data][:attributes][:destination]).to be_a(String)
        expect(books[:data][:attributes]).to have_key(:forecast)
        expect(books[:data][:attributes][:forecast]).to be_a(Hash)
        expect(books[:data][:attributes]).to have_key(:total_books_found)
        expect(books[:data][:attributes][:total_books_found]).to be_a(Integer)
        expect(books[:data][:attributes]).to have_key(:books)
        expect(books[:data][:attributes][:books]).to be_a(Array)
        expect(books[:data][:attributes][:books].count).to eq(5)

      end
    end
    describe 'Sad Path' do
      it 'sends an error when an invalid location is sent', :vcr do

        get '/api/v1/book-search', params: {location:"", quantity: 1 }
        books = JSON.parse(response.body, symbolize_names: true)
        expect(response.status).to eq(404)
        expect(books).to be_a Hash
        expect(books).to have_key(:errors)
        expect(books[:errors]).to eq("No results found for location, please use another location")
      end
    end
  end
end