# frozen_string_literal: true

class EventsController < ApplicationController
  # GET /weddings/<wedding-id>/new
  def new
    set_wedding
    @event = @wedding.events.new
  end

  def create
    set_wedding
    @event = @wedding.events.new(**event_parameters)

    if @event.save
      flash.now[:notice] = t("controllers.events_controller.create.notice")
      render status: :created
    else
      flash.now[:alert] = t("controllers.events_controller.create.alert")
      render status: :unprocessable_entity
    end
  end

  private

  def set_wedding
    @wedding = Wedding.find(params[:wedding_id])
  end

  def event_parameters
    EventParameters.new(params[:event])
  end
end
