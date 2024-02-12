# frozen_string_literal: true

class Invitation::Envelop < Invitation::ApplicationComponent
  attr_reader :invitation, :preview_mode

  def initialize(invitation:, preview_mode: false, **system_arguments)
    @invitation = invitation
    @preview_mode = preview_mode
    super(**system_arguments)
  end

  private

  def default_content_tag_arguments
    options = ::Html::TagAttributes.build(super, { class: "w-fit", style: "perspective: 1600px" })
    options = options.with_stimulus_action(
      "#{Invitation::Card.stimulus_identifier}:connected",
      stimulus_identifier,
      "registerCardController"
    )
    options = options.with_stimulus_controller(self.class.stimulus_identifier)
    options.to_h
  end
end
