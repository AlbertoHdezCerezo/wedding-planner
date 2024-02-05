# frozen_string_literal: true

class Invitation::Envelop < Invitation::ApplicationComponent
  attr_reader :invitation

  def initialize(invitation:, **system_arguments)
    @invitation = invitation
    super(**system_arguments)
  end

  private

  def default_content_tag_arguments
    options = ::Html::TagAttributes.build(super, { class: "w-fit opacity-0", style: "perspective: 1600px" })
    options = options.with_stimulus_controller(self.class.stimulus_identifier)
    options.to_h
  end
end
