# frozen_string_literal: true

module Invitation::Common
  class ButtonComponent < Common::ButtonComponent
    protected

    def default_content_tag_arguments
      ::Html::TagAttributes.build(super, { class: "uppercase !text-[10px] tracking-[.05em]" }).to_h
    end
  end
end
