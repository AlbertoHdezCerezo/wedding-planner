# frozen_string_literal: true

class Invitation::Pages::TravelGuide < Invitation::Pages::Page
  def self.page_name = "travel-guide"

  attr_reader :invitation

  def initialize(invitation:, **system_arguments)
    @invitation = invitation
    super(**system_arguments)
  end
end
