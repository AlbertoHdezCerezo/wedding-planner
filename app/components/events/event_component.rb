# frozen_string_literal: true

class Events::EventComponent < ApplicationComponent
  attr_reader :event

  def initialize(event:, **system_arguments)
    @event = event
    super(**system_arguments)
  end

  private

  def default_content_tag_arguments
    {
      id: dom_id(event),
      class: "w-full inline-flex items-start gap-8 text-gray-900"
    }
  end
end
