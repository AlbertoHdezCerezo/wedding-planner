# frozen_string_literal: true

# @label Title Component
class Common::TitleComponentPreview < ViewComponent::Preview
  # @param title
  def default(title: "Title")
    render Common::TitleComponent.new(title:)
  end
end
