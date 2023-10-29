# frozen_string_literal: true

# Custom +ViewComponent+ based +FormBuilder+.
#
# Uses the components under +Common::Form+
class ComponentFormBuilder < ActionView::Helpers::FormBuilder
  def text_field(
    method_name,
    value = nil,
    field_arguments: {},
    label: nil,
    label_arguments: {},
    caption: nil,
    caption_arguments: {},
    **system_arguments,
    &
  )
    render_component(
      Common::Form::TextFieldComponent,
      method_name,
      value:,
      field_arguments:,
      label:,
      label_arguments:,
      caption:,
      caption_arguments:,
      **system_arguments,
      &
    )
  end

  private

  def render_component(
    component_klass,
    method_name,
    value: nil,
    field_arguments: {},
    label: nil,
    label_arguments: {},
    caption: nil,
    caption_arguments: {},
    **system_arguments,
    &
  )
    method_value = (object.public_send(method_name) if object.respond_to?(method_name))
    method_errors = object.errors.messages_for(method_name)

    component = component_klass.new(
      object_name,
      method_name,
      value: value || method_value,
      errors: method_errors,
      input_arguments: system_arguments,
      field_arguments:,
      caption:,
      caption_arguments:,
      label:,
      label_arguments:
    )

    component.render_in(@template, &)
  end
end
