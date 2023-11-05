class AddPersonalInformationToGuests < ActiveRecord::Migration[7.1]
  def change
    add_column :guests, :name, :string, null: false
    add_column :guests, :surname, :string, null: false
    add_column :guests, :country, :string, null: false
  end
end
