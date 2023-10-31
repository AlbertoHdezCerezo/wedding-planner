# frozen_string_literal: true

module Common
  class ModalComponent < ApplicationComponent
    class ModalContent < ApplicationComponent
      renders_one :header, TitleComponent
      renders_one :footer

      def call
        base_component(**content_tag_args) do
          if header
            concat(
              base_component(class: "relative px-8 pt-6 pb-4") do
                # Header title
                concat(header)

                # Close button
                concat(icon_button_component(icon: "x-mark",
                                             size: :large,
                                             scheme: :invisible,
                                             class: "absolute right-[32px] top-[15px]",
                                             "data-action": "click->#{ModalComponent.stimulus_identifier}#close"))
              end
            )
          end
          concat(content)
          concat(base_component(class: "px-8 pt-4 pb-6") { concat(footer) }) if footer
        end
      end

      protected

      def default_classes
        "flex flex-col rounded-2xl bg-white divide-y border-gray-100"
      end

      def default_content_tag_arguments
        {
          data: {
            "#{ModalComponent.stimulus_identifier}-target" => "content"
          }
        }
      end
    end

    # Slots
    # -----
    renders_one :trigger
    renders_one :modal_content, ModalContent

    protected

    def default_classes
      "contents"
    end

    def default_content_tag_arguments
      {
        data: {
          controller: stimulus_identifier
        }
      }
    end

    def modal_background_arguments
      tag_attributes(
        {
          class: "hidden fixed h-screen w-screen bg-gray-100 opacity-60 flex items-center justify-center",
          data: {
            "#{stimulus_identifier}-target" => "background"
          }
        }
      )
    end
  end
end
