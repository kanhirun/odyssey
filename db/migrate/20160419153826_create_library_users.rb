class CreateLibraryUsers < ActiveRecord::Migration
  def change
    create_table :library_users do |t|
      t.string :first_name,          null: false
      t.string :last_name,           null: false
      t.string :library_card_number, null: false
      t.string :email,               null: false
      t.string :phone_number,        null: false
      t.string :address_1,           null: false
      t.string :zip_code,            null: false

      t.timestamps null: false
    end
  end
end
