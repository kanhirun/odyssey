FactoryGirl.define do
  factory :library_user do
    transient do
      first_name 'Kevin'
      last_name 'Kanhirun'
      phone_number '8479701783'
      address_1 '424 W. Diversey Pkwy'
      zip_code '60614'
      email 'kel.kanhirun@gmail.com'
      library_card_number '234942184560'
    end

    initialize_with do
      LibraryUser.new(
        first_name: first_name,
        last_name: last_name,
        phone_number: phone_number,
        address_1: address_1,
        library_card_number: library_card_number,
        email: email,
        zip_code: zip_code,
      )
    end
  end
end
