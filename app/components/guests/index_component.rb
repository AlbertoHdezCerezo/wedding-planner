# frozen_string_literal: true

class Guests::IndexComponent < ApplicationComponent
  attr_reader :wedding, :guests

  def initialize(wedding:, guests:, **system_arguments)
    super(**system_arguments)
    @wedding = wedding
    @guests = guests
  end

  protected

  def default_classes
    <<-HTML
      h-full w-full flex flex-col items-center justify-center gap-3
      bg-white border-[1px] border-gray-200 rounded-md
    HTML
  end
end
