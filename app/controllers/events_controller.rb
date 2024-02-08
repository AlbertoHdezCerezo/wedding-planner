# frozen_string_literal: true

class EventsController < Planner::ApplicationController
  # GET /weddings/<wedding-id>/new
  def new
    set_wedding
    @event = @wedding.events.new
  end

  # GET /weddings/<wedding-id>/events/<id>/edit
  def edit
    set_event
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

  # PATCH /weddings/<wedding-id>/events/<id>
  def update
    set_event
    @event.assign_attributes(event_parameters)

    if @event.save
      flash.now[:notice] = t("controllers.events_controller.update.notice")
      render status: :ok
    else
      flash.now[:alert] = t("controllers.events_controller.update.alert")
      render status: :unprocessable_entity
    end
  end

  # DELETE /weddings/<wedding-id>/events/<id>
  def destroy
    set_event

    if @event.destroy
      flash.now[:notice] = t("controllers.events_controller.destroy.notice")
      render status: :ok
    else
      flash.now[:alert] = t("controllers.events_controller.destroy.alert")
      render status: :unprocessable_entity
    end
  end

  private

  def set_wedding
    @wedding = Wedding.find(params[:wedding_id])
  end

  def set_event
    @event = Event.includes(:wedding).find_by!(wedding_id: params[:wedding_id], id: params[:id])
  end

  def event_parameters
    EventParameters.new(params[:event])
  end
end
