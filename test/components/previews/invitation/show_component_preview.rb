# frozen_string_literal: true

class Invitation::ShowComponentPreview < ViewComponent::Preview
  def self.wedding # rubocop:todo Metrics/AbcSize
    date = Date.new(2024, 9, 14)

    wedding = FactoryBot.build(:wedding, date:, guests: FactoryBot.build_list(:guest, 1))
    place = FactoryBot.build(:place, name: "Parador de Plasencia")

    wedding.events << FactoryBot.build(:event, name: "Welcome Cocktail",
                                               schedule: (date + 15.hours)..(date + 17.hours), place:)
    wedding.events << FactoryBot.build(:event, name: "Engagement Ceremony",
                                               schedule: (date + 17.hours)..(date + 18.hours), place:)
    wedding.events << FactoryBot.build(:event, name: "Wedding Dinner", schedule: (date + 18.hours)..(date + 20.hours),
                                               place:)
    wedding.events << FactoryBot.build(:event, name: "Dance Party", schedule: (date + 20.hours)..(date + 24.hours),
                                               place:)

    wedding
  end

  def self.place
    FactoryBot.build(
      :place,
      name: "Parador de Plasencia",
      address: FactoryBot.build(
        :address,
        street: "Plaza San Vicente Ferrer, 5",
        town: "Plasencia",
        country: "Spain",
        zip_code: "10600"
      )
    )
  end

  layout "application"

  def default
    wedding = self.class.wedding
    guest = wedding.guests.first
    invitation = FactoryBot.build(:invitation, wedding:, guests: [guest])
    render(Invitation::ShowComponent.new(invitation:))
  end
end
