# frozen_string_literal: true

class Invitations::EditComponent::Form < ApplicationComponent
  class SelectableGuest < ApplicationComponent
    with_collection_parameter :guest

    attr_reader :guest, :selected, :form

    def initialize(form:, guest:, selected:, **system_arguments)
      @form = form
      @guest = guest
      @selected = selected
      super(**system_arguments)
    end

    def call
      base_component(**content_tag_arguments) do
        concat(content_tag(:p, "#{guest.name} #{guest.surname}"))
        concat(
          form.hidden_field(
            :guest_ids,
            name: "#{form.object_name}[guest_ids][]",
            value: guest.id,
            disabled: !selected,
            class: "peer"
          )
        )
        concat(icon_component(icon: "plus-circle", class: "peer-disabled:block hidden"))
        concat(icon_component(icon: "minus-circle", class: "block peer-disabled:hidden"))
      end
    end

    private

    def default_content_tag_arguments
      options = Html::TagAttributes.build(
        {
          class: <<-HTML
            w-full inline-flex items-center justify-between px-4 py-2 cursor-pointer text-gray-500
            hover:text-gray-700 hover:bg-gray-50
          HTML
        }
      )
      options = options.with_stimulus_action(
        :click,
        Invitations::EditComponent::Form.stimulus_identifier,
        "selectGuest"
      )
      options.to_h
    end
  end

  ID = "invitation-form"

  attr_reader :wedding, :invitation

  def initialize(wedding:, invitation:, **system_arguments)
    super(**system_arguments)
    @wedding = wedding
    @invitation = invitation
  end

  private

  def unselected_guests = wedding.guests.select { invitation.guests.exclude?(_1) }

  def default_content_tag_arguments
    Html::TagAttributes.build({
                                id: ID,
                                class: "flex flex-col gap-6 px-8 py-10",
                                data: { controller: stimulus_identifier }
                              }).to_h
  end
end
