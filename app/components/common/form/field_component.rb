# frozen_string_literal: true

module Common::Form
  class FieldComponent < ApplicationComponent
    attr_reader :object_name,
                :method_name,
                :value,
                :errors,
                :field_arguments,
                :caption,
                :caption_arguments,
                :label,
                :label_arguments

    def initialize(
      object_name,
      method_name,
      value: nil,
      errors: nil,
      input_arguments: {},
      field_arguments: {},
      caption: nil,
      caption_arguments: {},
      label: nil,
      label_arguments: {}
    )
      @value = value
      @errors = errors
      @object_name = object_name.to_s.dup
      @method_name = method_name.to_s.dup
      @field_arguments = field_arguments
      @label = label
      @label_arguments = label_arguments
      @caption = caption
      @caption_arguments = caption_arguments

      super(**input_arguments)
    end

    def field_content
      raise <<-ERROR
        FieldComponent #{self.class.name} does not define +field_content+ method.
        This method is required for each +FieldComponent+ class to render the form
        input tag they represent.
      ERROR
    end

    def call
      content_tag(:div, **field_tag_arguments) do
        # Label
        concat(content_tag(:label, (label || method_name).capitalize, **label_tag_arguments))
        # Input
        concat(field_content)
        # Caption
        concat(content_tag(:p, caption, **caption_tag_arguments)) if caption.present?
      end
    end

    protected

    def field_tag_arguments
      tag_attributes(
        {
          class: "flex flex-col gap-1.5"
        },
        field_arguments
      )
    end

    def label_tag_arguments
      tag_attributes(
        {
          for: content_tag_args[:id],
          class: "text-xs text-gray-600"
        },
        label_arguments
      )
    end

    def caption_tag_arguments
      tag_attributes(
        {
          class: "text-gray-400 text-[10px]"
        },
        caption_arguments
      )
    end

    def default_content_tag_arguments
      {
        class: "px-2.5 py-1.5 rounded-md border-[1px] border-gray-200 text-sm",
        id: "#{object_name}_#{method_name}",
        name: "#{object_name}[#{method_name}]",
        value:
      }
    end
  end
end
