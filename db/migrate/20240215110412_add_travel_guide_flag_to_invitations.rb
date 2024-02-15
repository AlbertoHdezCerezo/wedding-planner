class AddTravelGuideFlagToInvitations < ActiveRecord::Migration[7.1]
  def change
    add_column :invitations, :needs_travel_guide, :boolean
  end
end
