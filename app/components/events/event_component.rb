# frozen_string_literal: true

class Events::EventComponent < ApplicationComponent
  attr_reader :event

  def initialize(event:, **system_arguments)
    super(**system_arguments)
    @event = event
  end

  private

  def default_content_tag_arguments
    {
      class: "inline-flex items-start gap-8 text-gray-900"
    }
  end
end
