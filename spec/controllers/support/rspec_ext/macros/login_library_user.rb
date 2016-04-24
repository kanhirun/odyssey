module Support
  module LoginLibraryUser
    include Devise::TestHelpers

    def login_library_user
      @request.env["devise.mapping"] = Devise.mappings[:library_user]
      library_user = FactoryGirl.create(:library_user)
      sign_in library_user
    end
  end
end
