# frozen_string_literal: true

module Common::Form
  class TextFieldComponent < ApplicationComponent
    attr_reader :object_name, :method_name, :value, :wrapper

    def initialize(
      object_name,
      method_name,
      value: nil,
      errors: nil,
      required: false,
      field_wrapper_arguments: {},
      input_wrapper_arguments: {},
      label: nil,
      label_arguments: {},
      caption: nil,
      caption_arguments: {},
      **system_arguments
    )
      @value = value
      @object_name = object_name.to_s.dup
      @method_name = method_name.to_s.dup

      @wrapper = TextInputWrapperComponent.new(
        id,
        method_name,
        errors:,
        required:,
        input_wrapper_arguments:,
        caption:,
        caption_arguments:,
        label:,
        label_arguments:,
        **field_wrapper_arguments
      )

      super(**system_arguments)
    end

    def call
      render(wrapper) do
        text_field_tag(name, value, **content_tag_arguments)
      end
    end

    protected

    def id = "#{object_name}_#{method_name}"

    def name = "#{object_name}[#{method_name}]"

    def default_content_tag_arguments
      {
        id:,
        name:,
        class: "w-full focus:outline-0"
      }
    end
  end
end
