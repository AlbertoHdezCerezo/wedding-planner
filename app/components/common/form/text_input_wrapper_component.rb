# frozen_string_literal: true

module Common::Form
  class TextInputWrapperComponent < ApplicationComponent
    attr_reader :input_id,
                :method_name,
                :errors,
                :required,
                :field_arguments,
                :input_wrapper_arguments,
                :caption,
                :caption_arguments,
                :label,
                :label_arguments

    def initialize( # rubocop:todo Metrics/ParameterLists
      input_id,
      method_name,
      errors: nil,
      required: false,
      input_wrapper_arguments: {},
      label: nil,
      label_arguments: {},
      caption: nil,
      caption_arguments: {},
      **system_arguments
    )
      @input_id = input_id
      @method_name = method_name.to_s.dup
      @errors = errors
      @required = required
      @input_wrapper_arguments = input_wrapper_arguments
      @label = label
      @label_arguments = label_arguments
      @caption = caption
      @caption_arguments = caption_arguments

      super(**system_arguments)
    end

    protected

    def formatted_label = "#{(label || method_name).capitalize} #{"*" if required?}"

    def required? = required

    def valid? = errors.nil? || errors&.compact&.blank?

    def default_classes
      "flex flex-col gap-1.5 group"
    end

    def default_content_tag_arguments
      {
        data: {
          invalid: (!valid?).to_s
        }
      }
    end

    def label_tag_arguments
      tag_attributes(
        {
          for: input_id,
          class: "text-xs text-gray-600 group-data-[invalid=true]:text-cerise-400"
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

    def input_wrapper_tag_arguments
      tag_attributes(
        {
          class: <<-HTML
            px-2.5 py-1.5 rounded-md bg-white border-[1px] border-gray-200 text-sm
            focus-within:border-gray-400
            group-data-[invalid=true]:border-cerise-600
            group-data-[invalid=true]:focus-within:border-cerise-400
          HTML
        }
      )
    end
  end
end
