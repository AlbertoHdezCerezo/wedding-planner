# frozen_string_literal: true

class Invitation::Card < ApplicationComponent
  attr_reader :wedding, :guest

  def initialize(wedding:, guest:, **system_arguments)
    @wedding = wedding
    @guest = guest
    super(**system_arguments)
  end

  # Required to use +asset_path+ during component rendering
  def before_render
    @content_tag_arguments.merge!(
      style: "background-image: url('#{asset_path("postcard-background.svg")}')"
    )
  end

  private

  def default_content_tag_arguments
    {
      class: "w-fit p-8 shadow-lg",
      data: { controller: stimulus_identifier }
    }
  end

  def pages
    # Ignores component previews, set in the same namespace of the +Page+ components
    Invitation::Pages.constants
                     .map(&:to_s)
                     .grep_v(/(Preview|Page)\z/)
                     .map { "Invitation::Pages::#{_1}".constantize }
  end
end
