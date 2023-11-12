# frozen_string_literal: true

# Renders SVG icons and provides additional styling customization options
module Common
  class FlashComponent < ApplicationComponent
    ID = "flash"

    private

    def default_content_tag_arguments
      {
        class: "fixed top-4 right-4",
        id: ID
      }
    end
  end
end
