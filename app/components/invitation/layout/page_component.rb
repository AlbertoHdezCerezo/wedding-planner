# frozen_string_literal: true

class Invitation::Layout::PageComponent < ApplicationComponent
  def default_content_tag_arguments
    {
      class: <<-HTML
        h-[590px] w-[350px] max-h-screen max-w-screen
      HTML
    }
  end
end
