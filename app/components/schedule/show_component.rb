# frozen_string_literal: true

class Schedule::ShowComponent < ApplicationComponent
  attr_reader :wedding, :events

  def initialize(wedding:, events:, **system_arguments)
    super(**system_arguments)
    @wedding = wedding
    @events = events
  end

  private

  def default_content_tag_arguments
    {
      class: <<-HTML
        h-full w-full overflow-hidden inline-flex gap-24 py-8 px-8 bg-white
      HTML
    }
  end
end
