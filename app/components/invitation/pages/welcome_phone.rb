# frozen_string_literal: true

class Invitation::Pages::WelcomePhone < Invitation::Pages::Page
  def self.page_name = "welcome-phone"

  attr_reader :invitation, :invitation_state_transition

  def initialize(invitation:, preview_mode: false, **system_arguments)
    @invitation = invitation
    super(preview_mode:, **system_arguments)
  end
end
