# frozen_string_literal: true

class Places::IndexComponent < ApplicationComponent
  attr_reader :wedding, :places

  def initialize(wedding:, places:, **system_arguments)
    super(**system_arguments)
    @wedding = wedding
    @places = places
  end

  private

  def default_content_tag_arguments
    {
      class: <<-HTML
        h-full w-full overflow-hidden flex flex-col gap-4 py-8
        bg-white
      HTML
    }
  end
end
