require 'rails_helper'
require 'factory_helper'

require 'lib/chicago_public_library'
require 'lib/request_book/book'

RSpec.describe 'API', type: :request do
  describe 'POST /api/library_users' do
    it 'creates a new LibraryUser' do
      expect do
        # TODO: Hide construction behind a factory method
        #       `#attributes_for` doesn't work because of transient attributes
        post '/api/library_users', library_user: { first_name: 'Kevin',
                                                   last_name: 'Kanhirun',
                                                   phone_number: '8479701783',
                                                   address_1: '424 W. Diversey Pkwy',
                                                   zip_code: '60614',
                                                   email: 'kel.kanhirun@gmail.com',
                                                   library_card_number: '234942184560' }
      end.to change{ LibraryUser.count }.by 1

      # it is a JSON endpoint
      expect(response.content_type.to_s).to eq 'application/json'
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
