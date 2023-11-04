# frozen_string_literal: true

class GuestsController < ApplicationController
  # GET /weddings/<wedding-id>/guests
  def index
    set_wedding
    @guests = @wedding.guests
  end

  # GET /weddings/<wedding-id>/guests/new
  def new
    @guest = Guest.new
  end

  # GET /weddings/<wedding-id>/guests/<id>/edit
  def edit
    @guest = Guest.new
  end

  private

  def set_wedding
    @wedding = if Wedding.count == 0
                 Wedding.create(date: Date.new(2023, 9, 14))
               else
                 Wedding.first
               end
  end
end
