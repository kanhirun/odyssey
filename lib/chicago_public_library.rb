class ChicagoPublicLibrary
  INTERLIBRARY_URL = 'http://www.chipublib.org/request-an-interlibrary-loan'.freeze
  SUCCESS_MESSAGE  = 'Thanks for contacting us! Your interlibrary loan request has been submitted.'.freeze

  def self.book_request!(book:, user:)
    # Get the form from the page
    form = interlibrary_page!.forms.last

    # Fill the form with fields
    form_filler = BookRequestFormFiller.new(form)
    form_filler.fill_book_info(
      title:       book.title,
      author:      book.author,
      description: book.url
    )
    form_filler.fill_user_info(
      first_name:          user.first_name,
      last_name:           user.last_name,
      library_card_number: user.library_card_number,
      phone_number:        user.phone_number,
      zip_code:            user.zip_code,
      email:               user.email,
      address_1:           user.address_1
    )

    # Submit the form
    submit_button = form.submits.first
    response = form.submit(submit_button)

    if !response.body.include? SUCCESS_MESSAGE
      raise ValidationError.new('One or more fields must not be blank.')
    end
  end

  def self.interlibrary_page!
    agent = Mechanize.new
    agent.get(INTERLIBRARY_URL)
  end
end

