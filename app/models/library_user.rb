class LibraryUser
  attr_reader :first_name, :last_name, :library_card_number, :email, :phone_number, :address_1, :zip_code

  def initialize(first_name:, last_name:, library_card_number:, email:, phone_number:, address_1:, zip_code:)
    @first_name          = first_name
    @last_name           = last_name
    @library_card_number = library_card_number
    @email               = email
    @phone_number        = phone_number
    @address_1           = address_1
    @zip_code            = zip_code
  end
end
