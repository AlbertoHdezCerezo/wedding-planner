# frozen_string_literal: true

class Schedule::ShowComponent < ApplicationComponent
  attr_reader :wedding, :schedule

  def initialize(wedding:, schedule:, **system_arguments)
    super(**system_arguments)
    @wedding = wedding
    @schedule = schedule
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
