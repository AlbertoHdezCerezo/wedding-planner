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
    @guest = Guest.new
  end

  # GET /weddings/<wedding-id>/guests/<id>/edit
  def edit
    @guest = Guest.new
  end

  # POST /weddings/<wedding-id>/guests
  def create
    set_wedding
    @guest = @wedding.guests.new(**GuestParameters.new(params[:guest]))

    if @guest.save
      redirect_to guests_path(@wedding, @guest)
    else
      render status: :unprocessable_entity
    end
  end

  private

  def set_wedding
    @wedding = Wedding.find(params[:wedding_id])
  end
end
