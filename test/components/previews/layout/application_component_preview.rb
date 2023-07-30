# frozen_string_literal: true

class Layout::ApplicationComponentPreview < ViewComponent::Preview
  def with_title
    render(Layout::ApplicationComponent.new(title: "Wedding Planner")) do |component|
      component.with_body do
        tag.p("Application Body")
      end
    end
  end
end
