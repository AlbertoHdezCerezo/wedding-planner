# frozen_string_literal: true

# @label Popover Component
class Common::PopoverComponentPreview < ViewComponent::Preview
  def default
    render Common::PopoverComponent.new do |popover|
      popover.with_trigger do
        content_tag(:p, "trigger")
      end

      content_tag(:p, "content")
    end
  end
end
