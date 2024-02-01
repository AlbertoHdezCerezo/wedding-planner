# frozen_string_literal: true

class InvitationStateTransitionParameters < ApplicationParameters
  Schema = Dry::Schema.Params do
    required(:invitation_id).filled(:string)
    required(:event).filled(:string)
  end
end
