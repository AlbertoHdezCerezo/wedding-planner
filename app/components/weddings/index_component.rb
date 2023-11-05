# frozen_string_literal: true

class Weddings::IndexComponent < ApplicationComponent
  attr_reader :weddings

  def initialize(weddings:, **system_arguments)
    super(**system_arguments)
    @weddings = weddings
  end
end
