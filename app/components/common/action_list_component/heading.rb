# frozen_string_literal: true

module Common
  class ActionListComponent
    class Heading < ApplicationComponent
      attr_reader :title, :title_tag

      def initialize(title:, heading_level: 3, **system_arguments)
        @title = title
        @title_tag = :"h#{heading_level}"
        super(**system_arguments)
      end

      def call
        render BaseComponent.new(**content_tag_args) do
          content_tag(:span, title, class: "text-xs text-gray-500 font-semibold")
        end
      end

      protected

      def default_classes = "px-4 py-1.5"

      def default_content_tag_arguments
        {
          tag: :div,
          role: :presentation,
          aria: { hidden: true }
        }
      end
    end
  end
end
