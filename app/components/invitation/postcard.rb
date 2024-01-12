# frozen_string_literal: true

class Invitation::Postcard < ApplicationComponent
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
      class: "p-8 shadow-lg",
      data: { controller: stimulus_identifier },
    }
  end
end
