# frozen_string_literal: true

class Invitation::Letter < Invitation::ApplicationComponent
  attr_reader :invitation

  def initialize(invitation:, **system_arguments)
    @invitation = invitation
    super(**system_arguments)
  end

  private

  def default_content_tag_arguments
    options = ::Html::TagAttributes.build(
      { class: "absolute left-0 h-full w-full max-w-[1100px] overflow-y-scroll w-fit pt-[20%] pb-[20%]" }
    )
    options = options.with_stimulus_controller(stimulus_identifier)
    options.to_h
  end
end
