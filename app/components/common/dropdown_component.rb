# frozen_string_literal: true

module Common
  class DropdownComponent < ApplicationComponent
    TIPPY_OPTIONS = {
      trigger: "click",
      hideOnClick: true,
      interactive: true
    }.freeze
  end
end
