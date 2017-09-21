require_relative '../../lib/chicago_public_library'
require_relative '../../lib/request_book/book'

class BookRequestController < ApplicationController
  before_action :authenticate_library_user!

  def new
  end

  def book_request
    ChicagoPublicLibrary.book_request!(
      user: current_library_user,
      book: Book.new(book_params.symbolize_keys)
    )

    flash[:notice] = "Request successful."
    render :new
  end

  private
    def book_params
      params.require(:book).permit(:title, :author, :url)
    end
end
