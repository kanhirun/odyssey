require 'rails_helper'
require_relative 'support/rspec_ext/macros/login_library_user'

require 'lib/chicago_public_library'
require 'lib/request_book/book'

RSpec.describe BookRequestController, type: :controller do
  include Support::LoginLibraryUser

  before do
    login_library_user
  end

  describe '#new' do
    it 'returns 200/OK' do
      get :new

      expect(response).to have_http_status :ok
    end
  end

  describe '#book_request' do
    it 'makes a book request' do
      expect(ChicagoPublicLibrary).to receive(:book_request!).with(
        user: subject.current_library_user,
        book: Book.new(title: 'xUnit Test Patterns', author: 'Gerard Meszaros')
      )

      get :book_request, book: {
        title: 'xUnit Test Patterns',
        author: 'Gerard Meszaros'
      }

      expect(response).to have_http_status :ok
    end
  end
end
