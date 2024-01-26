# frozen_string_literal: true

class Weddings::LayoutComponent < ApplicationComponent
  attr_reader :wedding

  def initialize(wedding:, **system_arguments)
    super(**system_arguments)
    @wedding = wedding
  end

  private

  def default_content_tag_arguments
    { class: "h-full w-full overflow-hidden flex flex-col gap-4" }
  end
end
