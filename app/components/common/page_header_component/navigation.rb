# frozen_string_literal: true

# Renders SVG icons and provides additional styling customization options
module Common
  class PageHeaderComponent::Navigation < ApplicationComponent
    renders_many :items, lambda { |url, label, icon = nil, active = nil|
      attributes = Html::TagAttributes.build(
        {
          tag: :li,
          data: { active: },
          class: <<-HTML
            relative px-5 py-3 cursor-pointer text-gray-500 rounded-t-md
            hover:text-gray-800 hover:bg-gray-50
          HTML
        }
      ).to_h

      content_tag(:li, **attributes) do
        concat(
          link_to(url, class: "inline-flex gap-1") do
            concat(render Common::IconComponent.new(icon, size: :sm)) if icon.present?
            concat(content_tag(:span, label))
          end
        )
        if active
          concat(
            content_tag(
              :div, "", class: <<-HTML
                absolute h-[2.5px] w-[90%] bg-tiffany_blue-600 rounded-tr-sm rounded-tr-sm bottom-0 left-[5%]
              HTML
            )
          )
        end
      end
    }
  end
end
