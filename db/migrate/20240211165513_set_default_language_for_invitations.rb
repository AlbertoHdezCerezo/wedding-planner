class SetDefaultLanguageForInvitations < ActiveRecord::Migration[7.1]
  def up
    Invitation.where(language: nil).update_all(language: "en")
  end

  def down
    Invitation.update_all(language: nil)
  end
end
