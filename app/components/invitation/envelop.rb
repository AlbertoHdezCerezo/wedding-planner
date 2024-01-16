# frozen_string_literal: true

class Invitation::Envelop < ApplicationComponent
  attr_reader :wedding, :guest

  def initialize(wedding:, guest:, **system_arguments)
    @wedding = wedding
    @guest = guest
    super(**system_arguments)
  end

  private

  def default_content_tag_arguments
    options = ::Html::TagAttributes.build(super, { style: "perspective: 1600px" })
    options = options.with_stimulus_controller(self.class.stimulus_identifier)
    options.to_h
  end
end
