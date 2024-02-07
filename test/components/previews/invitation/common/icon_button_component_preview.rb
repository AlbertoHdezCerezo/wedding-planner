# frozen_string_literal: true

# @label Icon Button Component
class Invitation::Common::IconButtonComponentPreview < ViewComponent::Preview
  # Icon Button Component
  # ---------------------
  def default
    render_with_template
  end

  # @param icon text
  # @param size select { choices: [small, medium, large] }
  # @param scheme select { choices: [primary, secondary, invisible, danger, danger_invisible] }
  def playground(icon: "globe", size: "medium", scheme: "primary")
    render_with_template(locals: { icon:, size:, scheme: })
  end
end
