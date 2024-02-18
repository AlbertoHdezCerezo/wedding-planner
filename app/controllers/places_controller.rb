# frozen_string_literal: true

class PlacesController < ApplicationController
  # GET /weddings/<wedding-id>/places
  def index
    set_wedding
    @places = @wedding.places
  end

  # GET /weddings/<wedding-id>/new
  def new
    set_wedding
    @place = @wedding.places.new
  end

  # GET /weddings/<wedding-id>/places/<id>/edit
  def edit
    set_place
  end

  def create
    set_wedding
    @place = @wedding.places.new(**place_parameters)

    if @place.save
      flash.now[:notice] = t("controllers.places_controller.create.notice")
      render status: :created
    else
      flash.now[:alert] = t("controllers.places_controller.create.alert")
      render status: :unprocessable_entity
    end
  end

  # PATCH /weddings/<wedding-id>/places/<id>
  def update
    set_place
    @place.assign_attributes(place_parameters)

    if @place.save
      flash.now[:notice] = t("controllers.places_controller.update.notice")
      render status: :ok
    else
      flash.now[:alert] = t("controllers.places_controller.update.alert")
      render status: :unprocessable_entity
    end
  end

  # DELETE /weddings/<wedding-id>/places/<id>
  def destroy
    set_place

    if @place.destroy
      flash.now[:notice] = t("controllers.places_controller.destroy.notice")
      render status: :ok
    else
      flash.now[:alert] = t("controllers.places_controller.destroy.alert")
      render status: :unprocessable_entity
    end
  end

  private

  def set_wedding
    @wedding = Wedding.find(params[:wedding_id])
  end

  def set_place
    @place = Place.includes(:wedding).find_by!(wedding_id: params[:wedding_id], id: params[:id])
  end

  def place_parameters
    PlaceParameters.new(params[:place])
  end
end
