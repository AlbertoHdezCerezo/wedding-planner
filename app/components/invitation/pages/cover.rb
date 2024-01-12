# frozen_string_literal: true

class Invitation::Pages::Cover < ApplicationComponent
  attr_reader :wedding, :guest

  def initialize(wedding:, guest:, **system_arguments)
    @wedding = wedding
    @guest = guest
    super(**system_arguments)
  end
end