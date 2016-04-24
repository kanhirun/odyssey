module ControllerMacros
  def login_user
    @request.env["devise.mapping"] = Devise.mappings[:library_user]

    user = Factory.create(:library_user)
    sign_in user
  end
end
