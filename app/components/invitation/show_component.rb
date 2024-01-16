# frozen_string_literal: true

class Invitation::ShowComponent < ApplicationComponent
  attr_reader :wedding, :guest

  def initialize(wedding:, guest:, **system_arguments)
    @wedding = wedding
    @guest = guest
    super(**system_arguments)
  end

  def default_content_tag_arguments
    {
      class: <<-HTML
        h-screen w-screen flex items-center justify-center overflow-hidden
      HTML
    }
  end
end
