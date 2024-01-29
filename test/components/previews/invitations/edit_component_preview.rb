# frozen_string_literal: true

class Invitations::EditComponentPreview < ViewComponent::Preview
  def default
    wedding = Wedding.first || FactoryBot.create(:wedding)
    guests = wedding.guests.count > 3 ? wedding.guests : FactoryBot.create_list(:guest, 5, wedding:)
    invitation = wedding.invitations.first || FactoryBot.create(:invitation, wedding:, guests: [guests.first])
    render_with_template(locals: { wedding:, invitation: })
  end
end
