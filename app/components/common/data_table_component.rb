# frozen_string_literal: true

module Common
  class DataTableComponent < ApplicationComponent
    DENSITIES = {
      condensed: "condensed",
      normal: "normal",
      spacious: "spacious"
    }.freeze

    # Slots
    # -----
    renders_one :header
    renders_one :footer
    renders_many :columns, lambda { |title, **system_arguments, &block|
      DataTableComponent::Column.new(title, **system_arguments, &block)
    }

    attr_reader :items, :density

    def initialize(
      items:,
      density: DENSITIES[:normal],
      **system_arguments
    )
      super(**system_arguments)

      @items = items
      @density = density
    end

    protected

    def default_classes
      <<-HTML
        
      HTML
    end
  end
end
