require 'rails_helper'

require 'lib/chicago_public_library'
require 'lib/request_book/book'
require 'lib/request_book/book_request_form_filler'
require 'app/models/library_user'

RSpec.describe ChicagoPublicLibrary, order: :defined, type: :integration do
  describe '.interlibrary_page!' do
    it 'returns a page that has a 200 code' do
      page = ChicagoPublicLibrary.interlibrary_page!

      expect(page.code).to eq('200'), <<-BAD_STATUS_CODE.strip_heredoc
        =================================================================================
        Expected HTTP status code to equal 200, but got #{page.code}.

        IF 4xx:
          Because the application's services rely on webscraping, it may be necessary to
          visit the Chicago Public Library's website, http://www.chipublib.org, to
          determine what changes are needed.
        IF 5xx:
          The Chicago Public Library website is currently down, which this application
          depends on. You can confirm this with a cURL request, or by visiting with a
          browser. Please try again in a few minutes.
        =================================================================================
      BAD_STATUS_CODE
    end
  end

  describe '.book_request!' do
    let(:user) { Factory.build(:library_user) }
    let(:book) { Factory.build(:book) }

    it 'requests a book' do
      VCR.use_cassette('book-request-success') do
        ChicagoPublicLibrary.book_request!(book: book, user: user)
      end
    end

    context 'when the book request fails', order: :random do
      it 'raises an error' do
        book_with_blank_title = Factory.build(:book, title: '')

        expect do
          ChicagoPublicLibrary.book_request!(book: book_with_blank_title, user: user)
        end.to raise_error(ChicagoPublicLibrary::BookRequestError, /The book request failed\./)
      end

      xit 'saves the HTML response in a tempfile for debugging' do
      end
    end
  end
end
