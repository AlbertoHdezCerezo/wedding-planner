# frozen_string_literal: true

# Renders SVG icons and provides additional styling customization options
module Common
  class IconComponent < ApplicationComponent
    ICONS_ASSET_PATH = "icons/"

    SIZES = {
      xs: "w-[12px] h-[12px]",
      sm: "w-[16px] h-[16px]",
      base: "w-[20px] h-[20px]",
      lg: "w-[22px] h-[22px]",
      xl: "w-[28px] h-[28px]"
    }.freeze

    attr_reader :icon, :size

    def initialize(icon, size: :base, **system_arguments)
      @icon = icon
      @size = size.to_sym
      super(**system_arguments)
    end

    def call
      # +inline_svg_tag+ requires data attribute to be passed as a hash
      # We perform a minor convertion of all +data-+ attributes to a hash
      data_argument = Html::Attribute.build(content_tag_arguments, name: "data")

      inline_svg_tag(svg_file, **content_tag_arguments.merge(data_argument.to_h))
    end

    protected

    def svg_file = @svg_file ||= "#{ICONS_ASSET_PATH}#{icon}.svg"

    def default_content_tag_arguments
      {
        # https://github.com/jamesmartin/inline_svg#accessibility
        "aria-hidden": true,
        title: icon,
        desc: "#{icon} icon",
        class: SIZES[size]
      }
    end
  end
end
