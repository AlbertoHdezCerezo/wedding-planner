# frozen_string_literal: true

class Guests::ShowComponentPreview < ViewComponent::Preview
  def default
    guest = FactoryBot.build(:guest)
    render_with_template(locals: { guest: })
  end
end