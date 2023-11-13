# frozen_string_literal: true

module Common
  class PopoverComponent < ApplicationComponent
    renders_one :trigger, lambda { |**system_arguments, &block|
      options = tag_attributes(
        {
          class: "cursor-pointer",
          "data-common--popover-component-target": "trigger"
        },
        system_arguments
      )
      base_component(**options, &block)
    }

    def call
      content_options = { class: "hidden", "data-common--popover-component-target": "content" }

      base_component(**content_tag_arguments) do
        concat(trigger)
        concat(base_component(**content_options) { content })
      end
    end

    private

    def default_content_tag_arguments
      {
        data: {
          controller: stimulus_identifier
        }
      }
    end
  end
end
