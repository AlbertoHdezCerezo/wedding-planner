# frozen_string_literal: true

# Custom +ViewComponent+ based +FormBuilder+.
#
# Uses the components under +Common::Form+
class ComponentFormBuilder < ActionView::Helpers::FormBuilder # rubocop:todo Metrics/ClassLength
  def date_field(
    method_name,
    value = nil,
    required: false,
    field_wrapper_arguments: {},
    input_wrapper_arguments: {},
    label: nil,
    label_arguments: {},
    caption: nil,
    caption_arguments: {},
    **system_arguments,
    &
  )
    component = Common::Form::DateFieldComponent.new(
      object_name,
      method_name,
      value: value || method_value(method_name),
      errors: method_errors(method_name),
      required:,
      field_wrapper_arguments:,
      input_wrapper_arguments:,
      label:,
      label_arguments:,
      caption:,
      caption_arguments:,
      **system_arguments
    )

    render_component(component, &)
  end

  def datetime_field(
    method_name,
    value = nil,
    required: false,
    field_wrapper_arguments: {},
    input_wrapper_arguments: {},
    label: nil,
    label_arguments: {},
    caption: nil,
    caption_arguments: {},
    **system_arguments,
    &
  )
    component = Common::Form::DatetimeFieldComponent.new(
      object_name,
      method_name,
      value: value || method_value(method_name),
      errors: method_errors(method_name),
      required:,
      field_wrapper_arguments:,
      input_wrapper_arguments:,
      label:,
      label_arguments:,
      caption:,
      caption_arguments:,
      **system_arguments
    )

    render_component(component, &)
  end

  def email_field(
    method_name,
    value = nil,
    required: false,
    field_wrapper_arguments: {},
    input_wrapper_arguments: {},
    label: nil,
    label_arguments: {},
    caption: nil,
    caption_arguments: {},
    **system_arguments,
    &
  )
    component = Common::Form::EmailFieldComponent.new(
      object_name,
      method_name,
      value: value || method_value(method_name),
      errors: method_errors(method_name),
      required:,
      field_wrapper_arguments:,
      input_wrapper_arguments:,
      label:,
      label_arguments:,
      caption:,
      caption_arguments:,
      **system_arguments
    )

    render_component(component, &)
  end

  def telephone_field(
    method_name,
    value = nil,
    required: false,
    field_wrapper_arguments: {},
    input_wrapper_arguments: {},
    label: nil,
    label_arguments: {},
    caption: nil,
    caption_arguments: {},
    **system_arguments,
    &
  )
    component = Common::Form::TelephoneFieldComponent.new(
      object_name,
      method_name,
      value: value || method_value(method_name),
      errors: method_errors(method_name),
      required:,
      field_wrapper_arguments:,
      input_wrapper_arguments:,
      label:,
      label_arguments:,
      caption:,
      caption_arguments:,
      **system_arguments
    )

    render_component(component, &)
  end

  def text_field(
    method_name,
    value = nil,
    required: false,
    field_wrapper_arguments: {},
    input_wrapper_arguments: {},
    label: nil,
    label_arguments: {},
    caption: nil,
    caption_arguments: {},
    **system_arguments,
    &
  )
    component = Common::Form::TextFieldComponent.new(
      object_name,
      method_name,
      value: value || method_value(method_name),
      errors: method_errors(method_name),
      required:,
      field_wrapper_arguments:,
      input_wrapper_arguments:,
      label:,
      label_arguments:,
      caption:,
      caption_arguments:,
      **system_arguments
    )

    render_component(component, &)
  end

  def text_area(
    method_name,
    value = nil,
    required: false,
    field_wrapper_arguments: {},
    input_wrapper_arguments: {},
    label: nil,
    label_arguments: {},
    caption: nil,
    caption_arguments: {},
    **system_arguments,
    &
  )
    component = Common::Form::TextAreaComponent.new(
      object_name,
      method_name,
      value: value || method_value(method_name),
      errors: method_errors(method_name),
      required:,
      field_wrapper_arguments:,
      input_wrapper_arguments:,
      label:,
      label_arguments:,
      caption:,
      caption_arguments:,
      **system_arguments
    )

    render_component(component, &)
  end

  def url_field(
    method_name,
    value = nil,
    required: false,
    field_wrapper_arguments: {},
    input_wrapper_arguments: {},
    label: nil,
    label_arguments: {},
    caption: nil,
    caption_arguments: {},
    **system_arguments,
    &
  )
    component = Common::Form::UrlFieldComponent.new(
      object_name,
      method_name,
      value: value || method_value(method_name),
      errors: method_errors(method_name),
      required:,
      field_wrapper_arguments:,
      input_wrapper_arguments:,
      label:,
      label_arguments:,
      caption:,
      caption_arguments:,
      **system_arguments
    )

    render_component(component, &)
  end

  private

  def method_value(method_name)
    object.public_send(method_name) if object.respond_to?(method_name)
  end

  def method_errors(method_name)
    object.errors.messages_for(method_name).uniq
  end

  def render_component(component_instance, &)
    component_instance.render_in(@template, &)
  end
end
