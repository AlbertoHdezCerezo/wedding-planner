# frozen_string_literal: true

class Guests::IndexComponent::Guest < ApplicationComponent
  with_collection_parameter :guest

  attr_reader :guest

  def initialize(guest:, **system_arguments)
    super(**system_arguments)
    @guest = guest
  end

  private

  def default_content_tag_arguments
    {
      tag: :li,
      class: "w-full inline-flex gap-4 px-6 py-4"
    }
  end
end
