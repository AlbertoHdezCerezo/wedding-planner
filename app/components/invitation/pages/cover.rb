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
