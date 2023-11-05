# frozen_string_literal: true

# Renders SVG icons and provides additional styling customization options
module Common
  class NavigationListComponent < ActionListComponent
    renders_many :links, types: {
      default: lambda do |url:, **system_arguments|
        active = @url.include?(url)
        Common::ActionListComponent::Item.new(
          tag: :a,
          size:,
          active:,
          href: url,
          index: rendered_item_slots.count,
          **system_arguments
        )
      end,
      divider: Divider
    }

    attr_reader :url

    def initialize(url: nil, size: "base", **system_arguments)
      @url = url
      super(size:, **system_arguments)
    end

    def before_render = @url = url || url_for
  end
end
