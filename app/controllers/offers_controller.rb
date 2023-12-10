# frozen_string_literal: true

class OffersController < ApplicationController
  # GET /weddings/<wedding-id>/offers
  def index
    set_wedding
  end

  private

  def set_wedding
    @wedding = Wedding.find(params[:wedding_id])
  end
end
