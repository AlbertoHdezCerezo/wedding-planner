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
    renders_one :title, Common::TitleComponent
    renders_one :empty_state, Common::EmptyStateComponent
    renders_many :columns, lambda { |title = nil, horizontal_alignment: :left, width: :auto, **system_arguments, &block|
      DataTableComponent::Column.new(title:, horizontal_alignment:, width:, **system_arguments, &block)
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

    private

    def default_content_tag_arguments
      {
        class: "flex flex-col gap-6 overflow-hidden"
      }
    end

    def table_wrapper_arguments(**system_arguments)
      column_widths = columns.map { _1.instance_variable_get(:@__vc_component_instance).width }

      tag_attributes(
        {
          class: "grid w-full flex-grow overflow-y-auto border-separate rounded-md border-spacing-0",
          style: "grid-template-columns: #{column_widths.join(" ")};"
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
            border-y-[1px] bg-gray-50 text-gray-900 font-semibold text-left
            first:border-l-[1px] first:rounded-tl-lg
            last:border-r-[1px] last:rounded-tr-lg
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
            bg-white border-gray-200 border-b-[1px] radius-bl-md text-gray-900
            first:border-l-[1px] data-[last-row=true]:first:rounded-bl-lg
            last:border-r-[1px] data-[last-row=true]:last:rounded-br-lg
          HTML
        },
        system_arguments
      )
    end
  end
end
