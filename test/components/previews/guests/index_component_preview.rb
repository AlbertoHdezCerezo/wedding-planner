# frozen_string_literal: true

class Guests::IndexComponentPreview < ViewComponent::Preview
  def default
    wedding = Wedding.first || FactoryBot.create(:wedding)
    guest = Guest.first || FactoryBot.create(:guest)
    render_with_template(locals: { wedding:, guest: })
  end
end
