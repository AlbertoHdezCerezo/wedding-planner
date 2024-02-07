# frozen_string_literal: true

module Common
  class ButtonComponent < ApplicationComponent
    SIZES = {
      small: "h-9 px-4 text-xs",
      medium: "h-11 px-5 text-base",
      large: "h-14 px-6 text-lg"
    }.freeze

    SCHEMES = {
      primary: "
        bg-gray-700 text-white
        hover:bg-gray-950 active:bg-black focus:bg-gray-950
      ",
      secondary: "
        bg-transparent text-gray-900 border-[1px] border-gray-200
        hover:bg-gray-100 active:bg-gray-50 focus:bg-gray-100
      ",
      invisible: "
        bg-transparent text-gray-800
        hover:bg-gray-100 active:bg-gray-200 focus:bg-gray-200
      ",
      danger: "
        bg-cerise-500 text-white
        hover:bg-cerise-400 active:bg-cerise-300 focus:bg-cerise-300
      ",
      danger_invisible: "
        bg-transparent text-cerise-400
        hover:bg-cerise-700 active:bg-cerise-600 focus:bg-cerise-600
        hover:text-white active:text-white focus:text-white
      "
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
        class: <<-HTML
          #{SIZES[size]}
          #{SCHEMES[scheme]}

          w-fit font-ibm font-medium rounded-full cursor-pointer flex items-center justify-center
          disabled:opacity-60 disabled:pointer-events-none
        HTML
      }
    end
  end
end
