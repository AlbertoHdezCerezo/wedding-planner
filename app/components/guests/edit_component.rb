# frozen_string_literal: true

class Guests::ShowComponent < ApplicationComponent
  attr_reader :guest

  def initialize(guest:, **system_arguments)
    super(**system_arguments)
    @guest = guest
  end
end
