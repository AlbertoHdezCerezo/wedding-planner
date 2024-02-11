class AddLanguageToInvitation < ActiveRecord::Migration[7.1]
  def change
    add_column :invitations, :language, :string, default: "en", null: false
  end
end
