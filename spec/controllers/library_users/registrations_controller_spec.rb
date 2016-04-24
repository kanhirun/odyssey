require 'rails_helper'

module LibraryUsers
  RSpec.describe RegistrationsController, type: :controller do
    it { is_expected.to be_a_kind_of Devise::RegistrationsController }
  end
end
