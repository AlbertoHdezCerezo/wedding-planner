# frozen_string_literal: true

class Invitation::Pages::Location < Invitation::Pages::Page
  def self.page_name = "location"

  attr_reader :invitation, :schedule, :schedule_decorator

  def initialize(invitation:, preview_mode: false, **system_arguments)
    @invitation = invitation
    super(preview_mode:, **system_arguments)
  end
end
