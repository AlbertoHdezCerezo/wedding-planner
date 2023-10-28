# frozen_string_literal: true

class Guests::EditComponent < ApplicationComponent
  attr_reader :guest

  def initialize(guest:, **system_arguments)
    super(**system_arguments)
    @guest = guest
  end

  protected

  def default_classes
    "py-4 rounded-md bg-white flex flex-col gap-3"
  end
end
