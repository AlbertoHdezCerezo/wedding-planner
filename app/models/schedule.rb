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
                       .sort { |event1, event2| event1.schedule.begin <=> event2.schedule.begin }
    end

    def time_range = events.first.schedule.begin..events.last.schedule.end
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
                      .sort { |group1, group2| group1.time_range.begin <=> group2.time_range.begin }
  end

  private

  def wedding_places = @wedding_places ||= wedding.events.map(&:place).uniq
end
