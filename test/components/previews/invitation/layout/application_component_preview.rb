# frozen_string_literal: true

class Invitation::Layout::ApplicationComponentPreview < ViewComponent::Preview
  def with_title
    render(Invitation::Layout::ApplicationComponent.new(title: "Wedding Invitation")) do |component|
      component.with_body do
        tag.p("Application Body")
      end
    end
  end
end
