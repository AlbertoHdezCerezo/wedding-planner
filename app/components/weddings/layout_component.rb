# frozen_string_literal: true

class Weddings::LayoutComponent < ApplicationComponent
  def initialize(wedding:, **system_arguments)
    super(**system_arguments)
    @wedding = wedding
  end
end
