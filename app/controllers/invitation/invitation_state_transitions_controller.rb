# frozen_string_literal: true

class Invitation::InvitationStateTransitionsController < Invitation::ApplicationController
  # POST /invitation_state_transition
  def create
    @invitation_state_transition = InvitationStateTransition.new(
      event: invitation_state_transition_params[:event],
      invitation: Invitation.find(invitation_state_transition_params[:invitation_id])
    )

    if @invitation_state_transition.save
      render json: { success: true }
    else
      render json: { errors: @invitation_state_transition.errors }, status: :unprocessable_entity
    end
  end

  private

  def invitation_state_transition_params = InvitationStateTransitionParameters.new(params[:invitation_state_transition])
end
