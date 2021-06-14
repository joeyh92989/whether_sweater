require 'rails_helper'

RSpec.describe 'Book Facade' do
  xit 'returns a Book object with all values', :vcr do
    response = BookFacade.book_search("denver,co")
    binding.pry
    expect(response).to be_a(Book)

  end
  it 'can return a collection of books with specific criteria', :vcr do
    books = OpenLibraryService.search("denver,co")
    array = BookFacade.create_book_array(books)
    binding.pry
    expect(array).to be_a(Array)
    expect(array.first.count).to eq(3)
    expect(array.first).to be_a(Hash)
    expect(array.first).to have_key(:isbn)
    expect(array.first[:isbn]).to be_a(Array)
    expect(array.first).to have_key(:title)
    expect(array.first[:title]).to be_a(String)
    expect(array.first).to have_key(:publisher)
    expect(array.first[:publisher]).to be_a(Array)
  end
end
