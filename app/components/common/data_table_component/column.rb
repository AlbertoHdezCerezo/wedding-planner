# frozen_string_literal: true

module Common
  class DataTableComponent::Column < ApplicationComponent
    attr_reader :title

    def initialize(title, **system_arguments, &block)
      super(**system_arguments)

      @title = title
      @system_arguments = system_arguments
      @block = block
    end

    def call(row) = @block.call(row)
  end
end
