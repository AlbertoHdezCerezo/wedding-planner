# frozen_string_literal: true

module Common
  class ModalConfirmationComponent < ApplicationComponent
    # Slots
    # -----
    renders_one :trigger

    attr_reader :confirmation_header,
                :confirmation_subheader,
                :confirm_label,
                :cancel_label,
                :confirm_button_arguments,
                :cancel_button_arguments

    def initialize(
      confirmation_header:,
      confirm_label:,
      cancel_label:,
      confirmation_subheader: nil,
      confirm_button_arguments: {},
      cancel_button_arguments: {},
      **system_arguments
    )
      super(**system_arguments)
      @confirmation_header = confirmation_header
      @confirmation_subheader = confirmation_subheader
      @confirm_label = confirm_label
      @cancel_label = cancel_label
      @confirm_button_arguments = confirm_button_arguments
      @cancel_button_arguments = cancel_button_arguments
    end

    def call
      render Common::ModalComponent.new(**content_tag_arguments) do |modal|
        if trigger?
          modal.with_trigger do
            concat(trigger)
          end
        end

        modal.with_modal_content(class: "w-[600px]") do |content|
          concat(
            content_tag(:div, class: "px-8 pt-10 pb-6") do
              title_component(title: confirmation_header, size: :small, class: "text-center") do |title|
                if confirmation_subheader.present?
                  title.with_subheader_text(confirmation_subheader)
                end
              end
            end
          )

          content.with_footer do
            concat(
              content_tag(:div, class: "w-full inline-flex gap-4") do
                concat(
                  button_component(
                    label: cancel_label,
                    scheme: :secondary,
                    **tag_attributes(
                      {
                        class: "flex-1",
                        "data-action": "click->#{Common::ModalComponent.stimulus_identifier}#close"
                      },
                      cancel_button_arguments
                    )
                  )
                )
                concat(
                  button_component(
                    label: confirm_label,
                    scheme: :primary,
                    **tag_attributes({ class: "flex-1" }, confirm_button_arguments)
                  )
                )
              end
            )
          end
        end
      end
    end
  end
end
