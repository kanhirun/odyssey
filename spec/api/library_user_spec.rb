require 'rails_helper'
require 'factory_helper'

require 'lib/chicago_public_library'
require 'lib/request_book/book'

RSpec.describe 'API', type: :request do
  describe 'POST /api/library_users' do
    it 'creates a new LibraryUser' do
      expect do
        post '/api/library_users', library_user: Factory.attributes_for(:library_user)
      end.to change{ LibraryUser.count }.by 1

      expect(response).to have_http_status :created
      require 'pry'; binding.pry
      expect(response.content_type.to_s).to eq 'application/json'
    end

    it 'fails to create a user when missing a required field' do
      expect do
        post '/api/library_users', library_user: Factory.attributes_for(:library_user, email: nil)
      end.not_to change{ LibraryUser.count }

      expect(response).to have_http_status :bad_request
    end
  end

  describe 'POST /api/library_users/:id/book_request' do
    it 'does a book request to the Chicago Public Library' do
      library_user = Factory.create(:library_user)
      book = Factory.build(
        :book,
        title: 'xUnit Test Patterns',
        author: 'Gerard Meszaros',
        url: 'http://www.amazon.com/xUnit-Test-Patterns-Refactoring-Code/dp/0131495054'
      )

      expect(ChicagoPublicLibrary).to receive(:book_request!).with(
        book: book,
        user: library_user
      )

      post "/api/library_users/#{library_user.id}/book_request", { book: {
        title: book.title,
        author: book.author,
        url: book.url
      }}
    end
  end
end
