# frozen_string_literal: true

class Layout::PageComponent::Sidebar < ApplicationComponent
  private

  def default_content_tag_arguments
    {
      class: "h-full flex flex-col"
    }
  end
end
