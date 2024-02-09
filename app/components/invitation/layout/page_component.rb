# frozen_string_literal: true

class Invitation::Layout::PageComponent < Invitation::ApplicationComponent
  def default_content_tag_arguments
    {
      class: <<-HTML
        h-[520px] w-[350px]
        landscape:max-lg:!w-[60vw] landscape:max-lg:!h-[60vh]
        m-auto overflow-y-scroll
      HTML
    }
  end
end
