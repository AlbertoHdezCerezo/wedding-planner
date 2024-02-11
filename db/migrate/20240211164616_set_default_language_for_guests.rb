class SetDefaultLanguageForGuests < ActiveRecord::Migration[7.1]
  def up
    Guest.where(language: nil).update_all(language: "en")
  end

  def down
    Guest.update_all(language: nil)
  end
end
