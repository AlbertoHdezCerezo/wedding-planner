# frozen_string_literal: true

class GuestsController < ApplicationController
  # GET /weddings/<wedding-id>/guests
  def index
    set_wedding
    @guests = @wedding.guests
  end

  # GET /weddings/<wedding-id>/guests/new
  def new
    set_wedding
    @guest = @wedding.guests.new
  end

  # GET /weddings/<wedding-id>/guests/<id>/edit
  def edit
    set_guest
  end

  # POST /weddings/<wedding-id>/guests
  def create
    set_wedding
    @guest = @wedding.guests.new(**guest_parameters)

    if @guest.save
      redirect_to wedding_guests_path(@wedding), notice: "Guest added to wedding"
    else
      flash[:alert] = "Invalid guest information"
      render status: :unprocessable_entity
    end
  end

  # PATCH /weddings/<wedding-id>/guests/<id>
  def update
    set_guest
    @guest.assign_attributes(guest_parameters)

    if @guest.save
      redirect_to wedding_guests_path(@guest.wedding)
    else
      render status: :unprocessable_entity
    end
  end

  private

  def guest_parameters = GuestParameters.new(params[:guest])

  def set_wedding
    @wedding = Wedding.find(params[:wedding_id])
  end

  def set_guest
    @guest = Guest.includes(:wedding).find_by!(wedding_id: params[:wedding_id], id: params[:id])
  end
end
