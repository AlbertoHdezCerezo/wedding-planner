# frozen_string_literal: true

class Events::EventComponent < ApplicationComponent
  attr_reader :event_decorator

  def initialize(event:, **system_arguments)
    @event_decorator = ::EventDecorator.new(event)
    super(**system_arguments)
  end

  private

  def default_content_tag_arguments
    {
      id: dom_id(event_decorator),
      class: "w-full inline-flex items-start gap-8 text-gray-900"
    }
  end
end
