# frozen_string_literal: true

# Renders SVG icons and provides additional styling customization options
module Common
  class ActionListComponent < ApplicationComponent
    SIZES = {
      base: "base",
      lg: "lg"
    }.freeze

    # Slots
    # -----
    renders_one :heading, ->(**system_arguments) { Common::ActionListComponent::Heading.new(**system_arguments) }

    renders_many :items, types: {
      default: lambda do |**system_arguments|
        Common::ActionListComponent::Item.new(size:, index: rendered_item_slots.count, **system_arguments)
      end,
      divider: lambda do |**system_arguments|
        Common::ActionListComponent::Divider.new(**system_arguments)
      end
    }

    attr_reader :size

    def initialize(size: "base", **system_arguments)
      @size = size
      super(**system_arguments)
    end

    protected

    def default_classes = "py-2"

    def default_content_tag_arguments = { tag: :ul }

    def rendered_item_slots = rendered_slots_by_name(:items) || []

    def rendered_heading_slot = rendered_slots_by_name(:heading).first

    def rendered_heading = rendered_heading_slot&.instance_variable_get(:@__vc_component_instance)
  end
end
