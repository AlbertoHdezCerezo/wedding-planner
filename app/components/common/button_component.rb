# frozen_string_literal: true

module Common
  class ButtonComponent < ApplicationComponent
    SIZES = {
      small: "small",
      medium: "medium",
      large: "large"
    }.freeze

    SCHEMES = {
      primary: "primary",
      secondary: "secondary",
      invisible: "invisible",
      danger: "danger",
      danger_invisible: "danger-invisible"
    }.freeze

    attr_reader :label, :size, :scheme

    def initialize(label: "", size: :medium, scheme: :primary, **system_arguments)
      @label = label
      @size = size.to_sym
      @scheme = scheme.to_sym
      super(**system_arguments)
    end

    def call
      base_component(**content_tag_arguments) do
        concat(content_tag(:span, label))
      end
    end

    protected

    def default_content_tag_arguments
      {
        tag: :button,
        data: {
          size: SIZES[size],
          scheme: SCHEMES[scheme]
        },
        class: <<-HTML
          w-fit font-medium rounded-full cursor-pointer flex items-center justify-center

          data-[size=small]:h-9 data-[size=small]:px-4 data-[size=small]:text-xs
          data-[size=medium]:h-11 data-[size=medium]:px-5
          data-[size=large]:h-14 data-[size=large]:px-6 data-[size=large]:text-lg

          data-[scheme=primary]:bg-gray-700 data-[scheme=primary]:text-white
          data-[scheme=primary]:hover:bg-gray-950 data-[scheme=primary]:active:bg-black data-[scheme=primary]:focus:bg-gray-950

          data-[scheme=secondary]:bg-white data-[scheme=secondary]:text-gray-900 data-[scheme=secondary]:border-[1px] data-[scheme=secondary]:border-gray-200
          data-[scheme=secondary]:hover:bg-gray-100 data-[scheme=secondary]:active:bg-gray-50 data-[scheme=secondary]:focus:bg-gray-100

          data-[scheme=invisible]:bg-transparent data-[scheme=invisible]:text-gray-800
          data-[scheme=invisible]:hover:bg-gray-100 data-[scheme=invisible]:active:bg-gray-200 data-[scheme=invisible]:focus:bg-gray-200

          data-[scheme=danger]:bg-cerise-500 data-[scheme=danger]:text-white
          data-[scheme=danger]:hover:bg-cerise-400 data-[scheme=danger]:active:bg-cerise-300 data-[scheme=danger]:focus:bg-cerise-300

          data-[scheme=danger-invisible]:bg-transparent data-[scheme=danger-invisible]:text-cerise-400
          data-[scheme=danger-invisible]:hover:bg-cerise-700 data-[scheme=danger-invisible]:active:bg-cerise-600 data-[scheme=danger-invisible]:focus:bg-cerise-600
          data-[scheme=danger-invisible]:hover:text-white data-[scheme=danger-invisible]:active:text-white data-[scheme=danger-invisible]:focus:text-white

          disabled:opacity-60 disabled:pointer-events-none
        HTML
      }
    end
  end
end
