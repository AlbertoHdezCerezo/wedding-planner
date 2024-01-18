# frozen_string_literal: true

class Invitation::ShowComponent < ApplicationComponent
  attr_reader :wedding, :guest

  def initialize(wedding:, guest:, **system_arguments)
    @wedding = wedding
    @guest = guest
    super(**system_arguments)
  end

  def default_content_tag_arguments
    options = ::Html::TagAttributes.build(
      { class: "absolute h-screen w-screen flex items-center justify-center overflow-hidden" }
    )
    options = options.with_stimulus_controller(stimulus_identifier)
    options = options.with_stimulus_action(
      "#{Invitation::Envelop.stimulus_identifier}:connected",
      stimulus_identifier,
      "registerEnvelopController"
    )
    options = options.with_stimulus_action(
      "#{Invitation::Letter.stimulus_identifier}:connected",
      stimulus_identifier,
      "registerLetterController"
    )
    options.to_h
  end
end
