# frozen_string_literal: true

class SchedulesController < Planner::ApplicationController
  # GET /weddings/<wedding-id>/schedule
  def show
    @wedding = Wedding.find(params[:wedding_id])
    @events = @wedding.events.chronological
  end
end
