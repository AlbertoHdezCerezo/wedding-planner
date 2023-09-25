# frozen_string_literal: true

class Weddings::IndexComponent < ApplicationComponent
  attr_reader :weddings

  def initialize(weddings: [], classes: nil, **system_arguments)
    super(classes:, **system_arguments)
    @weddings = weddings
  end
end
