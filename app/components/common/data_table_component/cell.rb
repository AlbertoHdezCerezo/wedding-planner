# frozen_string_literal: true

module Common
  class DataTableComponent::Cell < ApplicationComponent
    HORIZONTAL_ALIGNMENTS = {
      left: "left",
      center: "center",
      right: "right"
    }.freeze

    attr_reader :column, :columns, :horizontal_alignment

    def initialize(
      column:,
      columns:,
      horizontal_alignment: :left,
      **system_arguments
    )
      @column = column
      @columns = columns
      @horizontal_alignment = horizontal_alignment
      super(**system_arguments)
    end

    def call = render(BaseComponent.new(tag: :td, **content_tag_arguments)) { content }

    protected

    def first? = columns.first == column

    def last? = columns.last == column

    def default_content_tag_arguments
      {
        data: {
          "horizontal-alignment": horizontal_alignment
        },
        class: <<-HTML
          flex items-center
          data-[horizontal-alignment=left]:justify-start
          data-[horizontal-alignment=center]:justify-center
          data-[horizontal-alignment=right]:justify-end
          data-[horizontal-alignment=left]:text-left
          data-[horizontal-alignment=center]:text-center
          data-[horizontal-alignment=right]:text-right
          data-[density=condensed]:px-1 data-[density=condensed]:py-2
          data-[density=normal]:px-4 data-[density=normal]:py-3
          data-[density=spacious]:px-5 data-[density=spacious]:py-4
          first:data-[density=condensed]:pl-4
          first:data-[density=normal]:pl-4
          last:data-[density=condensed]:pr-4
          last:data-[density=normal]:pr-4
        HTML
      }
    end
  end
end
