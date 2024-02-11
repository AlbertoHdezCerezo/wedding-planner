class AddLanguageToGuests < ActiveRecord::Migration[7.1]
  def change
    add_column :guests, :language, :string, default: "en"
  end
end
