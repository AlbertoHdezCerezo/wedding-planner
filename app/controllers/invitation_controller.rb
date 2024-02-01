# frozen_string_literal: true

# Renders the client-side application representing the Wedding
# invitation for a specific +Guest+ of a specific +Wedding+
class InvitationController < ApplicationController
  # GET /invitation/<invitation-id>
  def show
    @invitation = Invitation.find(params[:id])
    open_invitation
  end

  private

  def open_invitation
    InvitationStateTransition.new(invitation: @invitation, event: :deliver).save if @invitation.pending?
    InvitationStateTransition.new(invitation: @invitation, event: :open).save if @invitation.sent?
  end
end
