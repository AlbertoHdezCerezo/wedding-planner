# frozen_string_literal: true

# Renders the client-side application representing the Wedding
# invitation for a specific +Guest+ of a specific +Wedding+
class Invitation::InvitationController < Invitation::ApplicationController
  # GET /invitation/<invitation-id>
  def show
    @invitation = Invitation.find(params[:id])
    @preview_mode = params.fetch(:preview_mode, false) == "true"

    I18n.locale = @invitation.language
    open_invitation if !@preview_mode && (@invitation.pending? || @invitation.delivered?)
  end

  private

  def open_invitation
    InvitationStateTransition.new(invitation: @invitation, event: :open).save
  end
end
