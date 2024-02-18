# frozen_string_literal: true

class Places::EditComponent < ApplicationComponent
  attr_reader :wedding, :place

  def initialize(wedding:, place:, **system_arguments)
    super(**system_arguments)
    @wedding = wedding
    @place = place
  end

  protected

  def default_classes
    "py-4 rounded-md bg-white flex flex-col gap-3"
  end
end
