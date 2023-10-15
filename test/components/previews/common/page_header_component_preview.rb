# frozen_string_literal: true

# @label Page Header Component
class Common::PageHeaderComponentPreview < ViewComponent::Preview
  # @param title
  # @param back_url
  # @param back_label
  def default(title: "Header Title", back_url: "/", back_label: "Back to weddings")
    render_with_template(
      locals: {
        title:,
        back_url:,
        back_label:
      }
    )
  end
end
