# frozen_string_literal: true

# Renders the client-side application representing the Wedding
# invitation for a specific +Guest+ of a specific +Wedding+
class InvitationController < ApplicationController
  # GET /invitation/<invitation-id>
  def show
    @invitation = Invitation.find(params[:id])
    open_invitation if !preview_mode? && (@invitation.pending? || @invitation.delivered?)
  end

  private

  def preview_mode? = params.fetch(:preview_mode, false)

  def open_invitation
    InvitationStateTransition.new(invitation: @invitation, event: :open).save
  end
end
