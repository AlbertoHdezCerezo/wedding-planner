# frozen_string_literal: true

class Invitation::Layout::PageComponent < ApplicationComponent
  def default_content_tag_arguments
    {
      class: <<-HTML
        h-[520px] w-[350px] max-h-[85%] max-w-[90%] m-auto
      HTML
    }
  end
end
