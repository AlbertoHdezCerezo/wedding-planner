# frozen_string_literal: true

module Common
  class DataTableComponent::Header < ApplicationComponent
    attr_reader :sort_url

    def initialize(sort_url: nil, **system_arguments)
      super(**system_arguments)

      @sort_url = sort_url
    end
  end
end
