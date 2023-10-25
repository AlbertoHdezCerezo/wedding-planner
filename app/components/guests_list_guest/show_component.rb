# frozen_string_literal: true

class GuestsListGuest::ShowComponent < ApplicationComponent
  attr_reader :guest

  def initialize(guest:, **system_arguments)
    super(**system_arguments)
    @guest = guest
  end

  protected

  def default_classes
    "w-full inline-flex gap-4 px-6 py-4 bg-white"
  end

  def default_content_tag_arguments
    {
      tag: :li
    }
  end
end
