# frozen_string_literal: true

# @label Title Component
class Common::TitleComponentPreview < ViewComponent::Preview
  def default
    render_with_template
  end

  def with_icons
    render_with_template
  end

  def with_subheader
    render_with_template
  end

  def with_icons_and_subheader
    render_with_template
  end
end
