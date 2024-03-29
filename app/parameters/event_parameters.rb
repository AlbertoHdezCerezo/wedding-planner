# frozen_string_literal: true

class EventParameters < ApplicationParameters
  Schema = Dry::Schema.Params do
    required(:name).filled(:string)
    required(:description).filled(:string)
    required(:start_time).filled(:date_time)
    required(:end_time).filled(:date_time)
    required(:place_id).filled(:string)
    required(:kind).filled(:string)

    after(:value_coercer) do |result|
      if result[:start_time].present? && result[:end_time]
        result.update({ schedule: result[:start_time]..result[:end_time] })
      end
    end
  end
end
