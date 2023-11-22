# frozen_string_literal: true

module Common
  class DatePickerComponent < ApplicationComponent
    class DayName < ApplicationComponent
      attr_reader :day_name

      def initialize(day_name:, **system_arguments)
        @day_name = day_name
        super(**system_arguments)
      end

      def call
        base_component(**content_tag_arguments) do
          content_tag(:p, day_name)
        end
      end

      private

      def default_content_tag_arguments
        {
          class: <<-HTML
            inline-flex items-center justify-center p-3 cursor-pointer
            rounded-full text-xs text-gray-900
          HTML
        }
      end
    end

    class Day < ApplicationComponent
      attr_reader :base_url, :date, :date_url_parameter_name, :selected

      def initialize(
        date:,
        base_url: nil,
        date_url_parameter_name: "date",
        selected: false,
        **system_arguments
      )
        @base_url = base_url
        @date = date
        @date_url_parameter_name = date_url_parameter_name
        @selected = selected
        super(**system_arguments)
      end

      def call
        arguments = content_tag_arguments

        if base_url.present?
          arguments[:tag] = :a
          arguments[:href] = "#{base_url}?#{date_url_parameter_name}=#{date}"
        end

        base_component(**arguments) do
          content_tag(:p, date.day)
        end
      end

      private

      def default_content_tag_arguments
        {
          aria: {
            selected:
          },
          data: {
            current: Date.current == date
          },
          class: <<-HTML
            inline-flex items-center justify-center h-8 w-8 m-auto cursor-pointer
            rounded-full text-xs text-gray-900
            hover:bg-gray-100
            data-[current=true]:bg-gray-900 data-[current=true]:text-white
            aria-selected:border-[1px] aria-selected:border-gray-500
          HTML
        }
      end
    end

    attr_reader :month,
                :selected_date,
                :url,
                :navigate_to_previous_month,
                :navigate_to_next_month,
                :day_tag_arguments

    def initialize(
      url:,
      year: nil,
      month: nil,
      selected_date: nil,
      navigate_to_previous_month: true,
      navigate_to_next_month: true,
      day_tag_arguments: {},
      **system_arguments
    )
      super(**system_arguments)

      unless (year.present? && month.present?) || selected_date.present?
        raise "CalendarComponent requires either a year and a month or a selected date to be rendered"
      end

      @url = url
      @selected_date = selected_date
      @month = Date new(year, month, 1) if selected_date.nil?
      @navigate_to_previous_month = navigate_to_previous_month
      @navigate_to_next_month = navigate_to_next_month
      @day_tag_arguments = day_tag_arguments
    end

    def calendar_month = @calendar_month ||= selected_date || month

    def calendar_page_date_range
      return @calendar_page_date_range if @calendar_page_date_range.present?

      month_first_day = calendar_month.beginning_of_month
      first_calendar_page_day = month_first_day - ((month_first_day.wday - 1) % 7).days

      month_last_day = calendar_month.end_of_month
      last_calendar_page_day = month_last_day + ((7 - month_last_day.wday) % 7).days

      @calendar_page_date_range = first_calendar_page_day..last_calendar_page_day
    end
  end
end
