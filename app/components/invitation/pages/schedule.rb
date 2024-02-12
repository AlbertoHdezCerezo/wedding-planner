# frozen_string_literal: true

class Invitation::Pages::Schedule < Invitation::Pages::Page
  def self.page_name = "schedule"

  attr_reader :invitation, :schedule, :schedule_decorator

  def initialize(invitation:, preview_mode: false, **system_arguments)
    @invitation = invitation
    @schedule = Schedule.new(wedding: invitation.wedding, guest: invitation.guests.first)
    super(preview_mode:, **system_arguments)
  end
end
