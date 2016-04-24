require 'rails_helper'

RSpec.describe LibraryUsersController, type: :controller do
  describe '#create' do
    xit "redirects to '/' url after successfully creating a user" do
      expect do
        post :create, library_user: { first_name: 'Kevin',
                                      last_name: 'Kanhirun',
                                      phone_number: '8479701783',
                                      address_1: '424 W. Diversey Pkwy',
                                      zip_code: '60614',
                                      email: 'kel.kanhirun@gmail.com',
                                      password: 'password',
                                      library_card_number: '234942184560' }
      end.to change{ LibraryUser.count }.by(1)

      expect(response).to redirect_to '/'
    end
  end
end
