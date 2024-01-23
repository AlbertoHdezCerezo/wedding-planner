# frozen_string_literal: true

class Schedule
  # Set of +Wedding+ +Events+ taking place at the same place, sorted by time
  class EventsGroup
    attr_reader :wedding, :events, :place

    def initialize(wedding:, place:)
      @place = place
      @wedding = wedding
      @events = wedding.events
                       .select { |event| event.place == place }
                       .sort { |event_1, event_2| event_1.schedule.begin <=> event_2.schedule.begin }
    end

    def schedule = events.first.schedule.begin..events.last.schedule.end
  end

  attr_reader :wedding, :guest

  def initialize(wedding:, guest:)
    unless wedding.in_guests_list?(guest)
      raise ArgumentError, "Schedule not intialized: given guest not present in weddings guests list"
    end

    @wedding = wedding
    @guest = guest
  end

  def event_groups
    @event_groups ||= wedding_places
                      .map { |place| EventsGroup.new(wedding:, place:) }
                      .sort { |group_1, group_2| group_1.schedule.begin <=> group_2.schedule.begin }
  end

  private

  def wedding_places = @wedding_places ||= wedding.events.map(&:place).uniq
end
