# frozen_string_literal: true

class Invitations::EditComponent::Form < ApplicationComponent
  ID = "invitation-form"

  attr_reader :wedding, :invitation

  def initialize(wedding:, invitation:, **system_arguments)
    super(**system_arguments)
    @wedding = wedding
    @invitation = invitation
  end

  private

  def default_content_tag_arguments
    {
      id: ID,
      class: "flex flex-col gap-6 px-8 py-10"
    }
  end
end
