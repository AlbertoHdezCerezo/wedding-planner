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

    def table_wrapper_arguments(**system_arguments)
      tag_attributes(
        {
          class: "w-full border-separate rounded-md border-spacing-0"
        },
        system_arguments
      )
    end

    def head_cell_arguments(**system_arguments)
      tag_attributes(
        {
          data: {
            density:
          },
          role: "rowgrop",
          class: <<-HTML
            border-y-[1px] bg-gray-100 text-gray-900 font-semibold text-left
            first:border-l-[1px] first:rounded-tl-md
            last:border-r-[1px] last:rounded-tr-md
          HTML
        },
        system_arguments
      )
    end

    def body_cell_arguments(**system_arguments)
      tag_attributes(
        {
          data: { density: },
          role: "rowgrop",
          class: <<-HTML
            bg-white border-b-[1px] radius-bl-md text-gray-900
            first:border-l-[1px] data-[last-row=true]:first:rounded-bl-md
            last:border-r-[1px] data-[last-row=true]:last:rounded-br-md
          HTML
        },
        system_arguments
      )
    end
  end
end
