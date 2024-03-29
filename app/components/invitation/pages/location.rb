# frozen_string_literal: true

class Invitation::Pages::Location < Invitation::Pages::Page
  def self.page_name = "location"

  attr_reader :invitation, :schedule, :schedule_decorator

  def initialize(invitation:, preview_mode: false, **system_arguments)
    @invitation = invitation
    super(preview_mode:, **system_arguments)
  end

  private

  def default_content_tag_arguments
    options = ::Html::TagAttributes.build({ class: "px-8 py-10" })
    options = options.with_stimulus_controller(stimulus_identifier)
    options.to_h
  end
end
