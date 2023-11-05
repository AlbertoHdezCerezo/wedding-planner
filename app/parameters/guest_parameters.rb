# frozen_string_literal: true

class GuestParameters < ApplicationParameters
  Schema = Dry::Schema.Params do
    required(:name).filled(:string)
    required(:surname).filled(:string)
    required(:country).filled(:string)
  end
end
