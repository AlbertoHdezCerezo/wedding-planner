# frozen_string_literal: true

class Invitation::Pages::Cover < Invitation::Pages::Page
  def self.page_name = "cover"

  attr_reader :invitation, :invitation_state_transition

  def initialize(invitation:, **system_arguments)
    @invitation = invitation
    @invitation_state_transition = InvitationStateTransition.new(event: "accept", invitation:)
    super(**system_arguments)
  end

  private

  def default_content_tag_arguments
    options = ::Html::TagAttributes.build(super)
    options = options.with_stimulus_controller(stimulus_identifier)
    options.to_h
  end
end
