# frozen_string_literal: true

# @label Modal Component
class Common::ModalComponentPreview < ViewComponent::Preview
  def default
    render Common::ModalComponent.new do |modal|
      modal.with_modal_content(class: "w-[800px]") do |modal_content|
        modal_content.with_header(title: "Modal Window")
        content_tag(:p, "Cacahue")
      end
    end
  end
end
