# frozen_string_literal: true

module Common
  class IconButtonComponent < ButtonComponent
    ICON_SIZES = {
      small: "sm",
      medium: "base",
      large: "xl"
    }.freeze

    BUTTON_SIZES = {
      small: "!w-9 text-sm",
      medium: "!w-11 text-lg",
      large: "!w-14 text-xl"
    }.freeze

    attr_reader :icon

    def initialize(icon:, size: :medium, scheme: :primary, **system_arguments)
      @icon = icon
      super(size:, scheme:, **system_arguments)
    end

    def call
      base_component(**content_tag_arguments) do
        concat(icon_component(icon:, size: ICON_SIZES[size]))
      end
    end

    protected

    def default_content_tag_arguments
      tag_attributes(super, { class: "flex items-center justify-center !p-0 #{BUTTON_SIZES[size]}" })
    end
  end
end
