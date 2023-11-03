# frozen_string_literal: true

module Common
  class ActionListComponent
    class Item < ApplicationComponent
      SIZES = {
        base: "base",
        lg: "lg"
      }.freeze

      renders_one :leading_visual, types: {
        icon: ->(icon:, **system_arguments) { Common::IconComponent.new(icon, size: :sm, **system_arguments) }
      }

      renders_one :trailing_visual, types: {
        icon: ->(icon:, **system_arguments) { Common::IconComponent.new(icon, size: :sm, **system_arguments) }
      }

      attr_reader :index, :label, :label_tag_arguments, :active, :disabled, :size

      def initialize( # rubocop:disable Metrics/ParameterLists
        index:,
        label: nil,
        label_arguments: {},
        size: "base",
        active: false,
        disabled: false,
        **system_arguments
      )
        @id = generate_id

        @size = size
        @active = active
        @disabled = disabled

        @label = label
        @label_tag_arguments = tag_attributes({ id: label_id, class: "text-gray-700" }, label_arguments)

        @index = index

        super(**system_arguments)
      end

      private

      def label_id = "#{id}-label"

      def default_content_tag_arguments
        {
          tag: :li,
          role: :listitem,
          tabindex: index,
          labelledby: label_id,
          data: {
            size: size.to_s,
            active: active.to_s,
            disabled: disabled.to_s
          },
          class: <<-HTML
            relative flex items-center flex-start rounded-lg cursor-pointer text-gray-900
            hover:bg-gray-100
            data-[size=base]:mx-2 data-[size=base]:px-3 data-[size=base]:py-1.5
            data-[size=lg]:mx-3 data-[size=lg]:px-4 data-[size=lg]:py-2.5
            data-[active=true]:bg-gray-50
            data-[active=true]:hover:bg-gray-100
            data-[disabled=true]:cursor-not-allowed
            data-[disabled=true]:opacity-60
            data-[disabled=true]:hover:bg-transparent
            data-[active=true]:data-[disabled=true]:hover:bg-gray-50
          HTML
        }
      end
    end
  end
end
