# frozen_string_literal: true

class Events::EditComponent < ApplicationComponent
  attr_reader :event

  def initialize(event:, **system_arguments)
    super(**system_arguments)
    @event = event
  end
end
