# frozen_string_literal: true

class Invitations::EditComponentPreview < ViewComponent::Preview
  def default
    invitation = FactoryBot.build(:invitation)
    render_with_template(locals: { invitation: })
  end
end
