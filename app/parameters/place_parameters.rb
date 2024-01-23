# frozen_string_literal: true

class PlaceParameters < ApplicationParameters
  Schema = Dry::Schema.Params do
    extend WithNestedAssociation

    has_one :address, schema: AddressParameters::Schema

    required(:name).filled(:string)
    required(:phone).filled(:string)
    required(:maps_url).filled(:string)
    required(:email).filled(:string)
  end
end
