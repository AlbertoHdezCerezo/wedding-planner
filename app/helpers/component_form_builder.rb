# frozen_string_literal: true

class ComponentFormBuilder < ActionView::Helpers::FormBuilder
  def text_field(method_name, value = nil, **system_arguments, &)
    render_component(Common::Form::TextFieldComponent, method_name, value, &)
  end

  private

  def render_component(component_klass, method_name, value = nil, **system_arguments, &)
    method_value = (object.public_send(method_name) if object.respond_to?(method_name))

    component = component_klass.new(
      object_name,
      method_name,
      value || method_value,
      **system_arguments
    )

    component.render_in(@template, &)
  end
end
