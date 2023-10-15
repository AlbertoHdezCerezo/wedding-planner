# frozen_string_literal: true

# Renders SVG icons and provides additional styling customization options
module Common
  class PageHeaderComponent < ApplicationComponent
    # Slots
    # -----
    renders_one :title, ->(title) { Title.new(title:) }
    renders_one :description, -> { Description.new }
    renders_one :navigation, -> { Navigation.new }

    attr_reader :back_url, :back_label

    def initialize(
      back_url: nil,
      back_label: nil,
      **system_arguments
    )
      super(**system_arguments)

      @back_url = back_url
      @back_label = back_label
    end

    protected

    def default_classes
      "w-full flex flex-col bg-white"
    end
  end
end
