# frozen_string_literal: true

class Layout::PageComponent < ApplicationComponent
  private

  def default_content_tag_arguments
    {
      class: "w-screen h-screen flex flex-row bg-white"
    }
  end
end
