require 'rails_helper'

RSpec.describe 'Book Facade' do
  it 'returns a Book object with all values', :vcr do
    response = BookFacade.book_search("denver,co")
    binding.pry
    expect(response).to be_a(Book)

  end
end
