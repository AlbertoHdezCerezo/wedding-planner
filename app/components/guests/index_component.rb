# frozen_string_literal: true

class Guests::IndexComponent < ApplicationComponent
  attr_reader :wedding, :guests

  def initialize(wedding:, guests:, **system_arguments)
    super(**system_arguments)
    @wedding = wedding
    @guests = guests
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
