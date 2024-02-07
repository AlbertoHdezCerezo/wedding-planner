# frozen_string_literal: true

module Invitation::Common
  class ButtonComponent < Common::ButtonComponent
    SCHEMES = { cardboard: "
      bg-transparent text-gray-900 border-[1px] border-gray-200 opacity-60
      hover:opacity-100 active:opacity-100 focus:opacity-100
    " }.freeze

    protected

    def default_content_tag_arguments
      options = { class: "uppercase !text-[10px] tracking-[.05em] #{SCHEMES[scheme] if SCHEMES.key?(scheme)}" }
      ::Html::TagAttributes.build(super, options).to_h
    end
  end
end
