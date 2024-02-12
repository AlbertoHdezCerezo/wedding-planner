# frozen_string_literal: true

class Invitation::Pages::Cover < Invitation::Pages::Page
  def self.page_name = "cover"

  attr_reader :invitation

  def initialize(invitation:, preview_mode: false, **system_arguments)
    @invitation = invitation
    super(preview_mode:, **system_arguments)
  end
end
