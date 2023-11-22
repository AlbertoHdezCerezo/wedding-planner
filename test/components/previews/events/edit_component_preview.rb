# frozen_string_literal: true

class Events::EditComponentPreview < ViewComponent::Preview
  def default
    wedding = FactoryBot.create(:wedding)
    event = FactoryBot.build(:event, wedding:)
    render_with_template(locals: { event: })
  end
end
