# frozen_string_literal: true

# Renders SVG icons and provides additional styling customization options
module Common
  class TitleComponent < ApplicationComponent
    renders_one :leading_visual, types: {
      icon: lambda { |icon, **system_arguments|
        Common::IconComponent.new(icon, **system_arguments)
      }
    }

    renders_one :trailing_visual, types: {
      icon: lambda { |icon, **system_arguments|
        Common::IconComponent.new(icon, **system_arguments)
      }
    }

    attr_reader :title

    def initialize(
      title:,
      **system_arguments
    )
      super(**system_arguments)

      @title = title
    end

    protected

    def default_classes
      "flex flex-row items-center gap-2 font-newsreader text-gray-800"
    end
  end
end
