# frozen_string_literal: true

class Weddings::ShowComponent::Layout < ApplicationComponent
  BODY_FRAME_ID = "weddings-layout-body"

  attr_reader :wedding

  def initialize(wedding:, **system_arguments)
    super(**system_arguments)
    @wedding = wedding
  end
end
