# frozen_string_literal: true

# Renders SVG icons and provides additional styling customization options
module Common
  class TitleComponent < ApplicationComponent
    SIZES = {
      small: "small",
      medium: "medium"
    }.freeze

    ICON_SIZES = {
      small: "lg",
      medium: "xl"
    }.freeze

    renders_one :leading_visual, types: {
      icon: lambda { |icon, **system_arguments|
        icon_component(icon:, size: ICON_SIZES[size], **system_arguments)
      }
    }

    renders_one :trailing_visual, types: {
      icon: lambda { |icon, **system_arguments|
        icon_component(icon:, size: ICON_SIZES[size], **system_arguments)
      }
    }

    renders_one :subheader, types: {
      text: lambda do |text, **system_arguments|
        options = tag_attributes(system_arguments, {
          class: "font-ibm text-gray-500 #{ size == :medium ? 'text-base' : 'text-sm' }"
        })
        content_tag(:p, text, **options)
      end,
      horizontal_description_list: lambda do |separator = "·", **system_arguments, &block|
        options = tag_attributes(system_arguments, { class: "font-ibm" })
        horizontal_description_list_component(separator:, size:, **options, &block)
      end
    }

    attr_reader :title, :size

    def initialize(title:, size: :medium, **system_arguments)
      @size = size
      @title = title
      super(**system_arguments)
    end

    private

    def default_content_tag_arguments
      {
        data: {
          size: SIZES[size]
        },
        class: <<-HTML
          font-newsreader text-gray-800
          data-[size=small]:text-xl
          data-[size=medium]:text-3xl
        HTML
      }
    end
  end
end
