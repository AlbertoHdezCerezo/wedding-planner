# frozen_string_literal: true

class Guests::EditComponent < ApplicationComponent
  attr_reader :wedding, :guest

  def initialize(wedding:, guest:, **system_arguments)
    super(**system_arguments)
    @wedding = wedding
    @guest = guest
  end

  protected

  def default_classes
    "py-4 rounded-md bg-white flex flex-col gap-3"
  end
end
