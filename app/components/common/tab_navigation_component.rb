# frozen_string_literal: true

# Renders SVG icons and provides additional styling customization options
module Common
  class TabNavigationComponent < ApplicationComponent
    renders_many :items, lambda { |url, label, icon: nil, active: nil|
      attributes = tag_attributes(
        {
          tag: :a,
          aria: { selected: active },
          class: <<-HTML
            relative px-8 py-3 cursor-pointer text-gray-500 rounded-t-lg
            hover:bg-gray-100
            aria-[selected]:border aria-[selected]:border-gray-200 aria-[selected]:border-b-0
            aria-[selected]:bg-white aria-[selected]:mb-[-2px]
          HTML
        }
      )

      content_tag(:li, **attributes) do
        concat(
          link_to(url, class: "inline-flex gap-1") do
            concat(icon_component(icon, size: :sm)) if icon.present?
            concat(content_tag(:span, label))
          end
        )
      end
    }

    private

    def tabs_wrapper_tag_arguments
      {
        role: "tablist",
        class: <<-HTML
          w-full flex flex-row px-12 mt-4 border-b border-gray-200 text-sm text-gray-800
        HTML
      }
    end

    def default_content_tag_arguments
      {
        tag: :nav,
        class: "w-full h-full flex flex-col bg-white"
      }
    end
  end
end
