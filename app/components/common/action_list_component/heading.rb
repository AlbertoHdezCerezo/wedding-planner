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
        base_component(**content_tag_arguments) do
          content_tag(:span, title, class: "text-xs text-gray-500 font-semibold")
        end
      end

      private

      def default_content_tag_arguments
        {
          tag: :div,
          role: :presentation,
          aria: { hidden: true },
          class: "px-4 py-1.5"
        }
      end
    end
  end
end
