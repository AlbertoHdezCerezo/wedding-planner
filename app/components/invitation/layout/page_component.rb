# frozen_string_literal: true

class Invitation::Layout::PageComponent < Invitation::ApplicationComponent
  def default_content_tag_arguments
    {
      class: <<-HTML
        h-[520px] w-[350px] max-w-[85vw] max-h-[75vh]
        m-auto overflow-y-scroll
      HTML
    }
  end
end
