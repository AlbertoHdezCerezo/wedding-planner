# frozen_string_literal: true

class PlaceParameters < ApplicationParameters
  Schema = Dry::Schema.Params do
    required(:name).filled(:string)
    required(:description).filled(:string)
    required(:address).filled(AddressParameters::Schema)
  end
end
