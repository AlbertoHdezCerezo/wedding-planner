# frozen_string_literal: true

class Invitation::Pages::TravelGuide < Invitation::Pages::Page
  def self.page_name = "travel-guide"

  attr_reader :invitation

  def initialize(invitation:, preview_mode: false, **system_arguments)
    @invitation = invitation
    super(preview_mode:, **system_arguments)
  end
end
