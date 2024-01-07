# frozen_string_literal: true

class Invitation::Layout::PageComponent < ApplicationComponent
  def default_content_tag_arguments
    {
      class: <<-HTML
        h-[667px] w-[375px] max-h-screen max-w-screen bg-white p-4
      HTML
    }
  end
end
