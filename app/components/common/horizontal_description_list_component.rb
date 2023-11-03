# frozen_string_literal: true

# Renders SVG icons and provides additional styling customization options
module Common
  class HorizontalDescriptionListComponent < ApplicationComponent
    class Item < ApplicationComponent
      private

      def default_content_tag_arguments
        { class: "flex flex-row items-center gap-2" }
      end
    end

    class TextTermItem < Item
      def initialize(field_name:, field_description:, **system_arguments)
        super(**system_arguments)
        @field_name = field_name
        @field_description = field_description
      end

      def call
        base_component(tag: :li, **content_tag_arguments) do
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
        base_component(tag: :li, **content_tag_arguments) do
          concat(icon_component(icon: @field_icon, size: :sm))
          concat(content_tag(:p, @field_description))
        end
      end
    end

    SIZES = {
      small: "small",
      medium: "medium"
    }.freeze

    renders_many :fields, types: {
      text: { renders: TextTermItem, as: :text_field },
      icon: { renders: IconTermItem, as: :icon_field }
    }

    attr_reader :separator, :size

    def initialize(separator: nil, size: :medium, **system_arguments)
      @size = size
      @separator = separator
      super(**system_arguments)
    end

    def call
      base_component(tag: :ul, **content_tag_arguments) do
        fields.each do |field|
          concat(field)
          concat(content_tag(:span, separator)) if separator.present? && field != fields.last
        end
      end
    end

    private

    def default_content_tag_arguments
      {
        data: {
          size: SIZES[size]
        },
        class: <<-HTML
          flex flex-row items-center text-gray-500
          data-[size=small]:text-sm
          data-[size=small]:gap-1
          data-[size=medium]:text-base
          data-[size=medium]:gap-2
        HTML
      }
    end
  end
end
