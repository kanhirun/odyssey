class BookRequestFormFiller
  class BookRequestForm
    {
      title_field:               'input_7',
      author_field:              'input_8',
      description_field:         'input_17',
      first_name_field:          'input_2.3',
      last_name_field:           'input_2.6',
      email_field:               'input_3',
      email_confirmation_field:  'input_3_2',
      phone_number_field:        'input_4',
      address_1_field:           'input_20',
      zip_code_field:            'input_21',
      library_card_number_field: 'input_1'
    }.each do |method_name, selector|
      # Dynamic Getter
      define_method(method_name) do
        form.field_with!(name: selector)
      end

      # Dynamic Setter
      define_method("#{method_name}=") do |value|
        form.field_with!(name: selector).value = value
      end
    end

    def initialize(form)
      @form = form
    end

    def check_content_type_as_book!
      form.radiobutton_with!(name: 'input_6').check
    end

    def check_book_format_as_hardcover_or_paperback_book!
      form.radiobutton_with!(name: 'input_19').check
    end

    def check_pickup_location_as_merlo!
      form.field_with!(name: 'input_18').option_with!(value: 'Merlo').select
    end

    private

    attr_reader :form
  end
end

