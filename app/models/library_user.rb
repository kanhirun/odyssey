class LibraryUser < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name,  presence: true
  validates :address_1,  presence: true
  validates :zip_code,   presence: true
  validates :library_card_number, presence: true,
                                  length: { is: 12 },
                                  numericality: true,
                                  uniqueness: true
  validates :email, presence: true,
                    uniqueness: true
  validates :phone_number, presence: true,
                           uniqueness: true
end
