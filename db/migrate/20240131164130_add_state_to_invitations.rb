class AddStateToInvitations < ActiveRecord::Migration[7.1]
  def change
    add_column :invitations, :state, :string, null: false, default: "created"
  end
end
