# frozen_string_literal: true

# @label Date Picker Component
class Common::DatePickerComponentPreview < ViewComponent::Preview
  def default
    render Common::DatePickerComponent.new(
      url: "/",
      selected_date: Date.current - 1.day
    )
  end
end
