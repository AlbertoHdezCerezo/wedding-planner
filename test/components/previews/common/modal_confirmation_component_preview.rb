# frozen_string_literal: true

# @label Modal Confirmation Component
class Common::ModalConfirmationComponentPreview < ViewComponent::Preview
  include ComponentHelper

  def without_trigger
    render Common::ModalConfirmationComponent.new(
      confirm_label: "Delete",
      cancel_label: "Cancel",
      confirmation_header: "Delete Event",
      confirmation_subheader: <<-TEXT
        Are you sure you want to delete this event?
        Once deleted data will be lost
      TEXT
    )
  end

  def with_trigger
    render Common::ModalConfirmationComponent.new(
      confirm_label: "Delete",
      cancel_label: "Cancel",
      confirmation_header: "Delete Event",
      confirmation_subheader: <<-TEXT
        Are you sure you want to delete this event?
        Once deleted data will be lost
      TEXT
    ) do |modal|
      modal.with_trigger do
        content_tag(:p, "trigger")
      end
    end
  end
end
