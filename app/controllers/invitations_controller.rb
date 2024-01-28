# frozen_string_literal: true

class InvitationsController < ApplicationController
  # GET /weddings/<wedding-id>/invitations
  def index
    set_wedding
    @invitations = @wedding.invitations
  end

  # GET /weddings/<wedding-id>/invitations/new
  def new
    set_wedding
    @invitation = @wedding.invitations.new
  end

  # GET /weddings/<wedding-id>/invitations/<id>/edit
  def edit
    set_invitation
  end

  # POST /weddings/<wedding-id>/invitations
  def create
    set_wedding
    @invitation = @wedding.invitations.new(**invitation_parameters)

    if @invitation.save
      flash.now[:notice] = t("controllers.invitations_controller.create.notice")
      render status: :created
    else
      flash.now[:alert] = t("controllers.invitations_controller.create.alert")
      render status: :unprocessable_entity
    end
  end

  # PATCH /weddings/<wedding-id>/invitations/<id>
  def update
    set_invitation

    # TODO: use parameters validations to set this up
    can_update = invitation_parameters[:guest_ids].present?

    @invitation.assign_attributes(invitation_parameters) if can_update

    if can_update && @invitation.save
      flash.now[:notice] = t("controllers.invitations_controller.update.notice")
      render status: :ok
    else
      flash.now[:alert] = t("controllers.invitations_controller.update.alert")
      render status: :unprocessable_entity
    end
  end

  # DELETE /weddings/<wedding-id>/invitations/<id>
  def destroy
    set_invitation

    if @invitation.destroy
      flash.now[:notice] = t("controllers.invitations_controller.destroy.notice")
      render status: :ok
    else
      flash.now[:alert] = t("controllers.invitations_controller.destroy.alert")
      render status: :unprocessable_entity
    end
  end

  private

  def invitation_parameters = InvitationParameters.new(params[:invitation])

  def set_wedding
    @wedding = Wedding.find(params[:wedding_id])
  end

  def set_invitation
    @invitation = Invitation.includes(:wedding).find_by!(wedding_id: params[:wedding_id], id: params[:id])
  end
end
