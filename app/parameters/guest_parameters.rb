# frozen_string_literal: true

class GuestParameters < ApplicationParameters
  Schema = Dry::Schema.Params do
    required(:name).filled(:string)
    required(:surname).filled(:string)
    required(:country).filled(:string)
    required(:language).filled(:string)
  end
end
