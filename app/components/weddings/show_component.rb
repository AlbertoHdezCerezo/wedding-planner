# frozen_string_literal: true

class Weddings::ShowComponent < ApplicationComponent
  attr_reader :wedding, :streamed

  def initialize(wedding:, streamed: false, **system_arguments)
    super(**system_arguments)
    @streamed = streamed
    @wedding = wedding
  end
end
