# frozen_string_literal: true

class Invitation::Pages::Schedule < Invitation::Pages::Page
  def self.page_name = "schedule"

  attr_reader :invitation, :schedule, :schedule_decorator

  def initialize(invitation:, **system_arguments)
    @invitation = invitation
    # TODO: obviously there is some incompatibility between schedule and invitation we need to fix
    # TODO: figure out a proper way to handle decorators
    @schedule = Schedule.new(wedding: invitation.wedding, guest: invitation.guests.first)
    @schedule_decorator = ScheduleDecorator.new(@schedule)
    super(**system_arguments)
  end
end
