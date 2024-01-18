# frozen_string_literal: true

class Invitation::Letter < ApplicationComponent
  attr_reader :wedding, :guest

  def initialize(wedding:, guest:, **system_arguments)
    @wedding = wedding
    @guest = guest
    super(**system_arguments)
  end

  private

  def default_content_tag_arguments
    options = ::Html::TagAttributes.build({ class: "absolute top-[100%] left-0 h-full w-full overflow-y-scroll w-fit pt-[20%] pb-[20%]" })
    options = options.with_stimulus_controller(stimulus_identifier)
    options.to_h
  end
end
