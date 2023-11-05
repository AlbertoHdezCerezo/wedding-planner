# frozen_string_literal: true

# Renders SVG icons and provides additional styling customization options
module Common
  class ActionListComponent < ApplicationComponent
    class Heading < ApplicationComponent
      attr_reader :title

      def initialize(title:, **system_arguments)
        @title = title
        super(**system_arguments)
      end

      def call
        base_component(**content_tag_arguments) do
          content_tag(:span, title, class: "font-newsreader text-xs text-gray-500 font-semibold")
        end
      end

      private

      def default_content_tag_arguments
        {
          tag: :div,
          role: :presentation,
          aria: { hidden: true },
          class: "px-4 py-1.5"
        }
      end
    end

    class Divider < ApplicationComponent
      def call = base_component(**content_tag_arguments)

      private

      def default_content_tag_arguments
        {
          tag: :li,
          role: "presentation",
          aria: { hidden: true },
          data: { targets: "action-bar.items" },
          class: "h-[1px] w-full my-4 bg-gray-200"
        }
      end
    end

    SIZES = {
      base: "base",
      lg: "lg"
    }.freeze

    # Slots
    # -----
    renders_one :heading, Heading

    renders_many :items, types: {
      default: lambda do |**system_arguments|
        Common::ActionListComponent::Item.new(size:, index: rendered_item_slots.count, **system_arguments)
      end,
      divider: Divider
    }

    attr_reader :size

    def initialize(size: "base", **system_arguments)
      @size = size
      super(**system_arguments)
    end

    protected

    def default_content_tag_arguments = { tag: :ul, class: "py-2" }

    def rendered_item_slots = rendered_slots_by_name(:items) || []

    def rendered_heading_slot = rendered_slots_by_name(:heading).first

    def rendered_heading = rendered_heading_slot&.instance_variable_get(:@__vc_component_instance)
  end
end
