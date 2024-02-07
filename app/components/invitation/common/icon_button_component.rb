# frozen_string_literal: true

module Invitation::Common
  class IconButtonComponent < Common::IconButtonComponent
    SCHEMES = { cardboard: "
      bg-transparent text-gray-500 border-[1px] border-gray-200 opacity-60
      hover:opacity-100 hover:bg-gray-100
      active:opacity-100 active:bg-gray-100
      focus:opacity-100 focus:bg-gray-100
    " }.freeze

    protected

    def default_content_tag_arguments
      options = { class: "uppercase !text-[10px] tracking-[.05em] #{SCHEMES[scheme] if SCHEMES.key?(scheme)}" }
      ::Html::TagAttributes.build(super, options).to_h
    end
  end
end
