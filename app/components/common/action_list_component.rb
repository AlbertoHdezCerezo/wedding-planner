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
    renders_one :heading, lambda { |**system_arguments| Common::ActionListComponent::Heading.new(**system_arguments) }
    renders_many :items, types: {
      default: lambda { |**system_arguments| Common::ActionListComponent::Item.new(size:, **system_arguments) },
      divider: lambda { |**system_arguments| Common::ActionListComponent::Divider.new(**system_arguments) },
    }

    attr_reader :size

    def initialize(size: "base", **system_arguments)
      @size = size
      super(**system_arguments)
    end

    protected

    def default_classes = "py-2"

    def default_content_tag_arguments = { tag: :ul }
  end
end
