# frozen_string_literal: true

module Common
  class ActionListComponent
    class Divider < ApplicationComponent
      SYSTEM_ARGUMENTS = {
        tag: :li,
        role: "presentation",
        aria: { hidden: true },
        data: { targets: "action-bar.items" },
        classes: "h-[1px] w-full my-2 bg-gray-200"
      }.freeze

      def call = render(BaseComponent.new(**SYSTEM_ARGUMENTS))
    end
  end
end
