# frozen_string_literal: true

class Places::EditComponent::Form < ApplicationComponent
  ID = "place-form"

  attr_reader :wedding, :place

  def initialize(wedding:, place:, **system_arguments)
    super(**system_arguments)
    @wedding = wedding
    @place = place
  end

  private

  def default_content_tag_arguments
    {
      id: ID,
      class: "flex flex-col gap-6 px-8 py-10"
    }
  end
end
