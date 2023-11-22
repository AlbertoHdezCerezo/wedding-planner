# frozen_string_literal: true

class SchedulesController < ApplicationController
  # GET /weddings/<wedding-id>/schedule
  def show
    set_wedding
  end

  private

  def set_wedding
    @wedding = Wedding.find(params[:wedding_id])
  end
end
