# frozen_string_literal: true

class Invitation::Layout::PageComponent < Invitation::ApplicationComponent
  def default_content_tag_arguments
    {
      class: <<-HTML
        h-[520px] w-[350px] max-h-[85%] max-w-[90%] m-auto overflow-y-scroll
      HTML
    }
  end
end
