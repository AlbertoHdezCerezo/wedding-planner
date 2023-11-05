# frozen_string_literal: true

class Weddings::EditComponent::Form < ApplicationComponent
  ID = "wedding-form"

  attr_reader :wedding

  def initialize(wedding:, **system_arguments)
    super(**system_arguments)
    @wedding = wedding
  end

  private

  def default_content_tag_arguments
    {
      id: ID,
      class: "flex flex-col gap-6 px-8 py-10"
    }
  end
end
