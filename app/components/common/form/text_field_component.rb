# frozen_string_literal: true

module Common::Form
  class TextFieldComponent < FieldComponent
    def call
      name = content_tag_args.delete(:id)
      value = content_tag_args.delete(:name)
      text_field_tag(name, value, **content_tag_args)
    end
  end
end
