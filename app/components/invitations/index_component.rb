# frozen_string_literal: true

class Invitations::IndexComponent < ApplicationComponent
  attr_reader :wedding, :invitations

  def initialize(wedding:, invitations:, **system_arguments)
    super(**system_arguments)
    @wedding = wedding
    @invitations = invitations
  end

  private

  def default_content_tag_arguments
    {
      class: <<-HTML
        h-full w-full overflow-hidden flex flex-col gap-4 py-8
        bg-white
      HTML
    }
  end
end
