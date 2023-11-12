# frozen_string_literal: true

# @label Flash Notification Component
class Common::FlashNotificationComponentPreview < ViewComponent::Preview
  def alert_flash
    render Common::FlashNotificationComponent.new(
      flash_type: "alert",
      flash_message: "This is an alert flash message"
    )
  end

  def notice_flash
    render Common::FlashNotificationComponent.new(
      flash_type: "notice",
      flash_message: "This is a notice flash message"
    )
  end
end
