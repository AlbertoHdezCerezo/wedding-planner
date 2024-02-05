# frozen_string_literal: true

# @label Button Component
class Invitation::Common::ButtonComponentPreview < ViewComponent::Preview
  # Button Component
  # ----------------
  def default
    render_with_template
  end

  # @param label text
  # @param size select { choices: [small, medium, large] }
  # @param scheme select { choices: [primary, secondary, invisible, danger, danger_invisible] }
  def playground(label: "button", size: "medium", scheme: "primary")
    render_with_template(locals: { label:, size:, scheme: })
  end
end
