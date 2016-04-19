require 'rails_helper'
require 'shoulda-matchers'
require 'spec/support/shoulda_matchers'

require 'app/models/library_user'

RSpec.describe LibraryUser, type: :model do
  it { is_expected.to have_db_column :first_name }
  it { is_expected.to validate_presence_of :first_name }

  it { is_expected.to have_db_column :last_name }
  it { is_expected.to validate_presence_of :last_name }

  it { is_expected.to have_db_column :library_card_number }
  it { is_expected.to validate_presence_of :library_card_number }
  it { is_expected.to validate_length_of(:library_card_number).is_equal_to(12) }
  it { is_expected.to validate_numericality_of(:library_card_number) }

  it { is_expected.to have_db_column :email }
  it { is_expected.to validate_presence_of :email }

  it { is_expected.to have_db_column :phone_number }
  it { is_expected.to validate_presence_of :phone_number }

  it { is_expected.to have_db_column :address_1 }
  it { is_expected.to validate_presence_of :address_1 }

  it { is_expected.to have_db_column :zip_code }
  it { is_expected.to validate_presence_of :zip_code }
end
