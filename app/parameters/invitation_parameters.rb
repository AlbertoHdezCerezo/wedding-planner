# frozen_string_literal: true

class InvitationParameters < ApplicationParameters
  Schema = Dry::Schema.Params do
    optional(:language).filled(:string)
    required(:guest_ids).filled(:array)
  end
end
