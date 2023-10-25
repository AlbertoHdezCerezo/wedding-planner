# frozen_string_literal: true

class GuestsList::ShowComponent < ApplicationComponent
  attr_reader :wedding, :guests

  def initialize(wedding:, guests:, **system_arguments)
    super(**system_arguments)
    @wedding = wedding
    @guests = guests
  end

  protected

  def default_classes
    "h-full w-full flex flex-col"
  end
end
