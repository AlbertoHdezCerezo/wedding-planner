# frozen_string_literal: true

class Invitation::ShowComponent < Invitation::ApplicationComponent
  attr_reader :invitation, :preview_mode

  def initialize(invitation:, preview_mode: false, **system_arguments)
    @invitation = invitation
    @preview_mode = preview_mode
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
    options = options.with_stimulus_value("invitationAccepted", stimulus_identifier, invitation.accepted?)
    options.to_h
  end
end
