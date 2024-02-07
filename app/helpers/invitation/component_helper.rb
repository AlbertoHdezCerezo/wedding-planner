# frozen_string_literal: true

# Set of helpers for +Invitation::Common+ +ViewComponent+. These components
# are designed to be used as the regular +Common+ components, but in the scope
# of the +Invitation+ +Pages+
module Invitation::ComponentHelper
  def invitation_button_component(label:, size: :medium, scheme: :primary, **system_arguments, &)
    render(Invitation::Common::ButtonComponent.new(label:, size:, scheme:, **system_arguments), &)
  end

  def invitation_icon_button_component(icon:, size: :medium, scheme: :primary, **system_arguments)
    render(Invitation::Common::IconButtonComponent.new(icon:, size:, scheme:, **system_arguments))
  end
end
