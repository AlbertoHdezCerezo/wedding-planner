# frozen_string_literal: true

module Common
  class ActionListComponent
    class Divider < ApplicationComponent
      def call = base_component(**content_tag_arguments)

      private

      def default_content_tag_arguments
        {
          tag: :li,
          role: "presentation",
          aria: { hidden: true },
          data: { targets: "action-bar.items" },
          classes: "h-[1px] w-full my-2 bg-gray-200"
        }
      end
    end
  end
end
