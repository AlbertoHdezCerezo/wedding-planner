# frozen_string_literal: true

module Common
  class ActionListComponent
    class Divider < ApplicationComponent
      SYSTEM_ARGUMENTS = {
        tag: :hr,
        aria: { hidden: true },
        data: { targets: "action-bar.items" },
        classes: ""
      }.freeze

      def call = render(BaseComponent.new(**SYSTEM_ARGUMENTS))
    end
  end
end
