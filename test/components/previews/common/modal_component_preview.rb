# frozen_string_literal: true

# @label Modal Component
class Common::ModalComponentPreview < ViewComponent::Preview
  include ComponentHelper

  def without_trigger
    render Common::ModalComponent.new do |modal|
      modal.with_modal_content(class: "w-[800px]") do |modal_content|
        modal_content.with_header(title: "Modal Window")
        content_tag(:p, "Cacahue")
      end
    end
  end

  def with_trigger
    render Common::ModalComponent.new do |modal|
      modal.with_trigger do
        content_tag(:p, "trigger")
      end
      modal.with_modal_content(class: "w-[800px]") do |modal_content|
        modal_content.with_header(title: "Modal Window")
        content_tag(:p, "Cacahue")
      end
    end
  end
end
