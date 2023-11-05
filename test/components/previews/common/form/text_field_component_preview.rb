# frozen_string_literal: true

# @label Text Field Component
class Common::Form::TextFieldComponentPreview < ViewComponent::Preview
  # Text Field Component
  # --------------------
  # Renders a `type=text` `input` HTML element. Replicates `Rails` `text_field_tag` helper.
  #
  # rubocop:todo Layout/LineLength
  # @param object_name text "Name of the form object. Used in conjunction with `method_name` to set `input` `name` attribute as object_name[method_name]"
  # rubocop:enable Layout/LineLength
  # rubocop:todo Layout/LineLength
  # @param method_name text "Name of field. Used in conjunction with `object_name` to set `input` `name` attribute as object_name[method_name]"
  # rubocop:enable Layout/LineLength
  # @param value text "Field value"
  # @param errors text "Field error messages"
  # @param required toggle "If set to true, displays an * next to the label"
  # @param label text "Field label"
  # @param caption text "Field caption"
  # @param placeholder text "Field placeholder"
  def playground(
    object_name: :guest,
    method_name: :name,
    value: :pepe,
    errors: "I don#t like this name",
    required: false,
    label: "First name",
    caption: "This is the caption",
    placeholder: "Introduce name"
  )
    render Common::Form::TextFieldComponent.new(
      object_name, method_name, value:, errors: [errors], required:, label:, caption:, placeholder:
    )
  end
end
