module ControllerMacros
  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:library_user]

      user = Factory.create(:library_user)
      sign_in user
    end
  end
end
