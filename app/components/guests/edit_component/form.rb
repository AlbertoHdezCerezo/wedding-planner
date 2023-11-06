# frozen_string_literal: true

class Guests::EditComponent::Form < ApplicationComponent
  ID = "guest-form"

  attr_reader :wedding, :guest

  def initialize(wedding:, guest:, **system_arguments)
    super(**system_arguments)
    @wedding = wedding
    @guest = guest
  end

  private

  def default_content_tag_arguments
    {
      id: ID,
      class: "flex flex-col gap-6 px-8 py-10",
      data: { "turbo-frame": Common::TabNavigationComponent::TURBO_FRAME }
    }
  end
end
