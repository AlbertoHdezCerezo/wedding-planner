# frozen_string_literal: true

class Invitation::Pages::Common::AcceptInvitationButton < Invitation::ApplicationComponent
  attr_reader :invitation, :invitation_state_transition, :preview_mode

  def initialize(invitation:, preview_mode: false, **system_arguments)
    @invitation = invitation
    @preview_mode = preview_mode
    @invitation_state_transition = InvitationStateTransition.new(event: "accept", invitation:)
    super(**system_arguments)
  end

  private

  def calendar_url
    ::AddToCalendar::URLs.new(
      # TODO: we need to specify a time for the event
      start_datetime: invitation.wedding.date.to_time,
      title: invitation.wedding.name,
      description: "Party!!!",
      all_day: true,
      url: request.original_url,
      timezone: "Europe/London"
    ).ical_url
  end

  def default_content_tag_arguments
    options = ::Html::TagAttributes.build(super)
    options = options.with_stimulus_controller(stimulus_identifier)
    options.to_h
  end
end
