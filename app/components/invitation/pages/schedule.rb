# frozen_string_literal: true

class Invitation::Pages::Schedule < Invitation::Pages::Page
  def self.page_name = "schedule"

  attr_reader :schedule, :schedule_decorator

  def initialize(wedding:, guest:, **system_arguments)
    @schedule = Schedule.new(wedding:, guest:)
    @schedule_decorator = ScheduleDecorator.new(@schedule)
    super(**system_arguments)
  end
end
