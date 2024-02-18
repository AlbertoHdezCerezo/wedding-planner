# frozen_string_literal: true

class Invitation::Card < Invitation::ApplicationComponent
  attr_reader :invitation, :preview_mode

  def initialize(invitation:, preview_mode: false, **system_arguments)
    @invitation = invitation
    @preview_mode = preview_mode
    super(**system_arguments)
  end

  # Required to use +asset_path+ during component rendering
  def before_render
    @content_tag_arguments.merge!(
      style: "background-size: cover; background-position: center; background-image: url('#{asset_path("invitation/textures/envelop-texture.jpg")}')"
    )
  end

  private

  def default_content_tag_arguments
    {
      class: "w-fit p-6 md:p-8 shadow-lg pointer-events-auto",
      data: { controller: stimulus_identifier }
    }
  end

  def pages
    # Ignores component previews, set in the same namespace of the +Page+ components
    Invitation::Pages.constants.reject { |c| c == :Common }
                     .map(&:to_s)
                     .grep_v(/(Preview|Page)\z/)
                     .map { "Invitation::Pages::#{_1}".constantize }
  end
end
