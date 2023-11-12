# frozen_string_literal: true

# Renders SVG icons and provides additional styling customization options
module Common
  class FlashNotificationComponent < ApplicationComponent
    private

    attr_reader :flash_type, :flash_message

    def initialize(flash_type:, flash_message:)
      @flash_message = flash_message
      @flash_type = flash_type
      super
    end

    def default_content_tag_arguments
      {
        class: <<-HTML
          relative w-[300px]
          p-6 border border-2 border-gray-700 rounded-xl cursor-pointer
        HTML
      }
    end
  end
end
