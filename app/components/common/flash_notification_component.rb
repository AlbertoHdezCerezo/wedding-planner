# frozen_string_literal: true

# Renders SVG icons and provides additional styling customization options
module Common
  class FlashNotificationComponent < ApplicationComponent
    ICONS = {
      notice: "check-circle",
      alert: "exclamation-circle"
    }.freeze

    private

    attr_reader :flash_type, :flash_message, :icon

    def initialize(flash_type:, flash_message:, **system_arguments)
      @flash_message = flash_message
      @flash_type = flash_type
      @icon = ICONS[flash_type&.to_sym]
      super(**system_arguments)
    end

    def default_content_tag_arguments
      {
        data: {
          controller: stimulus_identifier
        },
        class: <<-HTML
          relative w-[300px]
          p-6 border border-2 border-gray-900 rounded-xl cursor-pointer
        HTML
      }
    end
  end
end
