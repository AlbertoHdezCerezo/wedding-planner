# frozen_string_literal: true

class WeddingParameters < ApplicationParameters
  Schema = Dry::Schema.Params do
    required(:date).filled(:date)
    required(:name).filled(:string)
  end
end
