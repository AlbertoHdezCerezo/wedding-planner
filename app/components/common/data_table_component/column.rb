# frozen_string_literal: true

module Common
  class DataTableComponent::Column < ApplicationComponent
    WIDTHS = {
      grow: "minmax(max-content, 1fr)",
      grow_collapse: "minmax(0, 1fr)",
      auto: "auto"
    }.freeze

    attr_reader :title, :horizontal_alignment, :width

    def initialize(title:, horizontal_alignment:, width: :auto, **system_arguments, &block)
      super(**system_arguments)

      @width = WIDTHS[width]
      @horizontal_alignment = horizontal_alignment
      @system_arguments = system_arguments
      @title = title
      @block = block
    end

    def call(row) = @block.call(row)
  end
end
