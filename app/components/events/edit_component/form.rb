# frozen_string_literal: true

class Events::EditComponent::Form < ApplicationComponent
  ID = "event-form"

  attr_reader :event

  def initialize(event:, **system_arguments)
    super(**system_arguments)
    @event = event
  end

  private

  def default_content_tag_arguments
    {
      id: ID,
      class: "max-h-[70vh] overflow-y-auto flex flex-col gap-6 px-8 py-10"
    }
  end
end
