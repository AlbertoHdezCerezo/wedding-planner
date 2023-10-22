# frozen_string_literal: true

# Renders SVG icons and provides additional styling customization options
module Common
  class HorizontalDescriptionListComponent < ApplicationComponent
    class Item < ApplicationComponent
      protected

      def default_classes = "flex flex-row items-center gap-1"
    end

    class TextTermItem < Item
      def initialize(field_name:, field_description:, **system_arguments)
        super(**system_arguments)
        @field_name = field_name
        @field_description = field_description
      end

      def call
        base_component(tag: :li, **content_tag_args) do
          concat(content_tag(:p, @field_name))
          concat(content_tag(:p, @field_description))
        end
      end
    end

    class IconTermItem < Item
      def initialize(field_icon:, field_description:, **system_arguments)
        super(**system_arguments)
        @field_icon = field_icon
        @field_description = field_description
      end

      def call
        base_component(tag: :li, **content_tag_args) do
          concat(icon_component(icon: @field_icon, size: :sm))
          concat(content_tag(:p, @field_description))
        end
      end
    end

    renders_many :fields, types: {
      text: { renders: TextTermItem, as: :text_field },
      icon: { renders: IconTermItem, as: :icon_field }
    }

    attr_reader :separator

    def initialize(separator: nil, **system_arguments)
      super(**system_arguments)
      @separator = separator
    end

    def call
      base_component(tag: :ul, **content_tag_args) do
        fields.each do |field|
          concat(field)
          concat(content_tag(:p, separator)) if separator.present? && field != fields.last
        end
      end
    end

    protected

    def default_classes
      "flex flex-row items-center gap-2 text-xs text-gray-500"
    end
  end
end
