require_relative 'book_request_form'

class BookRequestFormFiller
  attr_reader :form

  def initialize(form_obj)
    @form = BookRequestForm.new(form_obj)
  end

  def fill_book_info(title:,
                     author:,
                     description: '')
    form.check_content_type_as_book!
    form.check_book_format_as_hardcover_or_paperback_book!

    form.title_field       = title
    form.author_field      = author
    form.description_field = description
  end

  def fill_user_info(first_name:,
                     last_name:,
                     email:,
                     phone_number:,
                     address_1:,
                     zip_code:,
                     library_card_number:)

    form.first_name_field          = first_name
    form.last_name_field           = last_name
    form.email_field               = email
    form.email_confirmation_field  = email
    form.phone_number_field        = phone_number
    form.address_1_field           = address_1
    form.zip_code_field            = zip_code
    form.library_card_number_field = library_card_number

    form.check_pickup_location_as_merlo!
  end
end
