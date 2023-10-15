# frozen_string_literal: true

# Renders SVG icons and provides additional styling customization options
module Common
  class PageHeaderComponent::Description < ApplicationComponent
    renders_many :list_with_icons, lambda { |icon, text, **system_arguments|
      content_tag_args = Html::TagAttributes.build({
        class: "flex flex-row items-center gap-1"
      }, system_arguments)

      content_tag(:div, **content_tag_args.to_h) do
        concat(render Common::IconComponent.new(icon, size: :sm, **system_arguments))
        concat(content_tag(:p, text))
      end
    }

    protected

    def default_classes
      "flex flex-row items-center gap-3 text-xs text-gray-500"
    end
  end
end
