# frozen_string_literal: true

module Common
  class EmptyStateComponent < ApplicationComponent
    attr_reader :icon, :title, :subtitle, :button_label, :button_path, :button_arguments

    def initialize(
      icon:,
      title:,
      subtitle:,
      button_label:,
      button_path:,
      button_arguments: {},
      **system_arguments
    )
      @icon = icon
      @title = title
      @subtitle = subtitle
      @button_label = button_label
      @button_path = button_path
      @button_arguments = button_arguments
      super(**system_arguments)
    end

    private

    def default_content_tag_arguments
      {
        class: <<-HTML
          h-full w-full flex flex-col items-center
          justify-center gap-3 bg-white rounded-lg
        HTML
      }
    end

    def button_tag_arguments
      tag_attributes(
        {
          class: "mt-4"
        }, button_arguments
      )
    end
  end
end
