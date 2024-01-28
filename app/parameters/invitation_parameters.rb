# frozen_string_literal: true

class InvitationParameters < ApplicationParameters
  Schema = Dry::Schema.Params do
    required(:guest_ids).filled(:array)
  end
end
