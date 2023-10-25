# frozen_string_literal: true

# @label Button Component
class Common::ButtonComponentPreview < ViewComponent::Preview
  # Button Component
  # ----------------
  # @param label text
  # @param size select { choices: [small, medium, large] }
  # @param scheme select { choices: [primary, secondary, invisible, danger, danger_invisible] }
  def playground(label: "button", size: "medium", scheme: "primary")
    render_with_template(locals: { label:, size:, scheme: })
  end

  # @!group Schemes
  def primary
    render(Common::ButtonComponent.new(label: "Button", size: :medium, scheme: :primary))
  end

  def secondary
    render(Common::ButtonComponent.new(label: "Button", size: :medium, scheme: :secondary))
  end

  def invisible
    render(Common::ButtonComponent.new(label: "Button", size: :medium, scheme: :invisible))
  end

  def danger
    render(Common::ButtonComponent.new(label: "Button", size: :medium, scheme: :danger))
  end

  def danger_transparent
    render(Common::ButtonComponent.new(label: "Button", size: :medium, scheme: :danger_invisible))
  end
  # @!endgroup
end
