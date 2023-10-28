# frozen_string_literal: true

module Common
  class PageHeaderComponent < ApplicationComponent
    # Slots
    # -----
    renders_one :navigation, Navigation
    renders_one :title, ->(title) { TitleComponent.new(title:) }
    renders_one :description, Common::HorizontalDescriptionListComponent

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
      "w-full flex flex-col bg-white gap-2"
    end
  end
end
