# frozen_string_literal: true

# Renders the client-side application representing the Wedding
# invitation for a specific +Guest+ of a specific +Wedding+
class InvitationController < ApplicationController
  # GET /invitation/<invitation-id>
  def show
    @invitation = Invitation.find(params[:id])
  end
end
