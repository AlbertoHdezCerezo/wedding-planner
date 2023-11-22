# frozen_string_literal: true

module Common
  class ModalComponent < ApplicationComponent
    class ModalContent < ApplicationComponent
      renders_one :header, TitleComponent
      renders_one :footer

      def call # rubocop:todo Metrics/AbcSize
        base_component(**content_tag_arguments) do
          if header?
            concat(
              base_component(class: "relative px-8 pt-6 pb-4") do
                # Header title
                concat(header)

                # Close button
                concat(icon_button_component(icon: "x-mark",
                                             size: :medium,
                                             scheme: :invisible,
                                             class: "absolute right-[32px] top-[15px]",
                                             "data-action": "click->#{ModalComponent.stimulus_identifier}#close"))
              end
            )
          end

          unless header?
            concat(icon_button_component(icon: "x-mark",
                                         size: :medium,
                                         scheme: :invisible,
                                         class: "absolute right-[32px] top-[15px]",
                                         "data-action": "click->#{ModalComponent.stimulus_identifier}#close"))
          end

          concat(content)

          concat(base_component(class: "px-8 pt-4 pb-6") { concat(footer) }) if footer
        end
      end

      protected

      def default_content_tag_arguments
        {
          class: "flex flex-col rounded-2xl bg-white divide-y bg-white border border-gray-200 z-10",
          data: {
            "#{ModalComponent.stimulus_identifier}-target" => "contentBody"
          }
        }
      end
    end

    # Slots
    # -----
    renders_one :trigger
    renders_one :modal_content, ModalContent

    protected

    def default_content_tag_arguments
      {
        id: stimulus_identifier,
        class: "content",
        data: {
          controller: stimulus_identifier
        }
      }
    end

    def trigger_tag_arguments
      tag_attributes(
        {
          class: "content cursor-pointer",
          data: {
            action: "click->#{stimulus_identifier}#open",
            "#{stimulus_identifier}-target" => "trigger"
          }
        }
      )
    end

    def modal_content_tag_arguments
      tag_attributes(
        {
          class: "hidden fixed top-0 left-0 h-screen w-screen
                  flex items-center justify-center",
          data: {
            "#{stimulus_identifier}-target" => "content"
          }
        }
      )
    end

    def modal_content_background_arguments
      tag_attributes(
        {
          class: "absolute h-full w-full bg-white",
          data: {
            "#{stimulus_identifier}-target" => "contentBackground",
            action: "click->#{stimulus_identifier}#close"
          }
        }
      )
    end
  end
end
