# frozen_string_literal: true

class Weddings::ShowComponent < ApplicationComponent
  attr_reader :wedding

  def initialize(wedding:, **system_arguments)
    super(**system_arguments)
    @wedding = wedding
  end
end
