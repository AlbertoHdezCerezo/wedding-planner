class AddInvitationReferenceToGuests < ActiveRecord::Migration[7.1]
  def change
    add_reference :guests, :invitation, null: true, foreign_key: true, type: :uuid
  end
end
