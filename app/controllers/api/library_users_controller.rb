class Api::LibraryUsersController < ApplicationController
  def create
    # Make this safe!
    LibraryUser.create!(library_user_params)

    render json: {}
  end

  def book_request
    # TODO: Remove this security risk, and replace with 'current_user'
    user = LibraryUser.find(params[:id])
    book = Book.new(book_params.symbolize_keys)

    ChicagoPublicLibrary.book_request!(book: book, user: user)

    render nothing: true
  end

  private
    def library_user_params
      params.require(:library_user).permit!
    end

    def book_params
      params.require(:book).permit!
    end
end
