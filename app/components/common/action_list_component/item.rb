# frozen_string_literal: true

module Common
  class ActionListComponent
    class Item < ApplicationComponent
      SIZES = {
        base: "base",
        lg: "lg"
      }.freeze

      renders_one :leading_visual, types: {
        icon: lambda { |icon:, **system_arguments| Common::IconComponent.new(icon, size: :base, **system_arguments) }
      }

      renders_one :trailing_visual, types: {
        icon: lambda { |icon:, **system_arguments| Common::IconComponent.new(icon, size: :base, **system_arguments) }
      }

      attr_reader :label, :label_arguments, :active, :disabled, :size

      def initialize(label: nil, label_arguments: {}, size: "base", active: false, disabled: false, **system_arguments)
        @size = size
        @active = active
        @disabled = disabled

        @label = label
        @label_arguments = {
          classes: class_names(label_classes, label_arguments[:classes])
        }

        super(**system_arguments)
      end

      protected

      def default_classes
        <<-HTML
          relative flex items-center flex-start rounded-sm cursor-pointer
          hover:bg-gray-100
          data-[size=base]:mx-2 data-[size=base]:px-2 data-[size=base]:py-1.5
          data-[size=lg]:mx-3 data-[size=lg]:px-3 data-[size=lg]:py-2.5
          data-[active=true]:bg-gray-50
          data-[active=true]:hover:bg-gray-100
          data-[disabled=true]:cursor-not-allowed
          data-[disabled=true]:opacity-60
          data-[disabled=true]:hover:bg-transparent
          data-[active=true]:data-[disabled=true]:hover:bg-gray-50
        HTML
      end

      def default_content_tag_arguments
        {
          tag: :li,
          role: :listitem,
          tabindex: "TODO",
          labelledby: "TODO",
          data: {
            size: size.to_s,
            active: active.to_s,
            disabled: disabled.to_s
          }
        }
      end

      def label_classes = "text-sm text-gray-700"
    end
  end
end
