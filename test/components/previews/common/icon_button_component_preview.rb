# frozen_string_literal: true

# @label Icon Button Component
class Common::IconButtonComponentPreview < ViewComponent::Preview
  # Icon Button Component
  # ---------------------
  # @param icon text
  # @param size select { choices: [small, medium, large] }
  # @param scheme select { choices: [primary, secondary, invisible, danger, danger_invisible] }
  def playground(icon: "globe", size: "medium", scheme: "primary")
    render_with_template(locals: { icon:, size:, scheme: })
  end

  # @!group Schemes
  def primary
    render(Common::IconButtonComponent.new(icon: "globe", size: :medium, scheme: :primary))
  end

  def secondary
    render(Common::IconButtonComponent.new(icon: "globe", size: :medium, scheme: :secondary))
  end

  def invisible
    render(Common::IconButtonComponent.new(icon: "globe", size: :medium, scheme: :invisible))
  end

  def danger
    render(Common::IconButtonComponent.new(icon: "globe", size: :medium, scheme: :danger))
  end

  def danger_transparent
    render(Common::IconButtonComponent.new(icon: "globe", size: :medium, scheme: :danger_invisible))
  end
  # @!endgroup
end
