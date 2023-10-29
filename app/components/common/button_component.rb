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
      base_component(**content_tag_args) do
        concat(content_tag(:span, label))
      end
    end

    protected

    def default_classes
      <<-HTML
        w-fit font-medium rounded-full cursor-pointer

        data-[size=small]:h-7 data-[size=small]:px-3.5 data-[size=small]:text-xs
        data-[size=medium]:h-8 data-[size=medium]:px-4 data-[size=medium]:text-sm
        data-[size=large]:h-10 data-[size=large]:px-5 data-[size=medium]:text-sm

        data-[scheme=primary]:bg-primary-500 data-[scheme=primary]:text-white
        data-[scheme=primary]:hover:bg-primary-400 data-[scheme=primary]:active:bg-primary-300 data-[scheme=primary]:focus:bg-primary-300

        data-[scheme=secondary]:bg-gray-100 data-[scheme=secondary]:text-gray-800 data-[scheme=secondary]:border-[1px] data-[scheme=secondary]:border-gray-400
        data-[scheme=secondary]:hover:bg-gray-200 data-[scheme=secondary]:active:bg-gray-300 data-[scheme=secondary]:focus:bg-gray-300

        data-[scheme=invisible]:bg-transparent data-[scheme=invisible]:text-gray-800
        data-[scheme=invisible]:hover:bg-gray-100 data-[scheme=invisible]:active:bg-gray-200 data-[scheme=invisible]:focus:bg-gray-200

        data-[scheme=danger]:bg-cerise-500 data-[scheme=danger]:text-white
        data-[scheme=danger]:hover:bg-cerise-400 data-[scheme=danger]:active:bg-cerise-300 data-[scheme=danger]:focus:bg-cerise-300

        data-[scheme=danger-invisible]:bg-transparent data-[scheme=danger-invisible]:text-cerise-400
        data-[scheme=danger-invisible]:hover:bg-cerise-700 data-[scheme=danger-invisible]:active:bg-cerise-600 data-[scheme=danger-invisible]:focus:bg-cerise-600
        data-[scheme=danger-invisible]:hover:text-white data-[scheme=danger-invisible]:active:text-white data-[scheme=danger-invisible]:focus:text-white

        disabled:opacity-60 disabled:pointer-events-none
      HTML
    end

    def default_content_tag_arguments
      {
        tag: :button,
        data: {
          size: SIZES[size],
          scheme: SCHEMES[scheme]
        }
      }
    end
  end
end
