# frozen_string_literal: true

module Common
  class IconButtonComponent < ButtonComponent
    ICON_SIZES = {
      small: "sm",
      medium: "base",
      large: "lg"
    }.freeze

    attr_reader :icon

    def initialize(icon:, size: :medium, scheme: :primary, **system_arguments)
      @icon = icon
      super(size:, scheme:, **system_arguments)
    end

    def call
      base_component(**content_tag_args) do
        concat(icon_component(icon:, size: ICON_SIZES[size]))
      end
    end

    protected

    def default_classes
      super +
        <<-HTML
        flex items-center justify-center
        data-[size=small]:w-7 data-[size=small]:px-1
        data-[size=medium]:w-8 data-[size=medium]:px-1
        data-[size=large]:w-10 data-[size=large]:px-1
        HTML
    end
  end
end
