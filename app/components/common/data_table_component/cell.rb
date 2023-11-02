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

    def default_classes
      <<-HTML
        data-[density=condensed]:px-2 data-[density=condensed]:py-1
        data-[density=normal]:px-3 data-[density=normal]:py-2
        data-[density=spacious]:px-4 data-[density=spacious]:py-3
        first:data-[density=condensed]:pl-4
        first:data-[density=normal]:pl-4
        last:data-[density=condensed]:pr-4
        last:data-[density=normal]:pr-4
      HTML
    end

    def default_content_tag_arguments
      { data: { horizontal_alignment: } }
    end
  end
end
