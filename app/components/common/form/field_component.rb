# frozen_string_literal: true

module Common::Form
  class FieldComponent < ApplicationComponent
    attr_reader :form, :object_name, :method_name, :value

    def initialize(object_name, method_name, value = nil, **system_arguments)
      @value = value
      @object_name = object_name.to_s.dup
      @method_name = method_name.to_s.dup

      super(**system_arguments)
    end

    protected

    def default_content_tag_arguments
      {
        id: "#{object_name}_#{method_name}",
        name: "#{object_name}[#{method_name}]",
        value:
      }
    end
  end
end
