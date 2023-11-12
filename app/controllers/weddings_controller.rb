# frozen_string_literal: true

class WeddingsController < ApplicationController
  # GET /weddings
  def index
    @weddings = Wedding.all
  end

  # GET /weddings/<id>
  def show
    @wedding = Wedding.find(params[:id])
  end

  # GET /weddings/new
  def new
    @wedding = Wedding.new
  end

  # POST /weddings
  def create
    @wedding = Wedding.new(**WeddingParameters.new(params[:wedding]))

    if @wedding.save
      redirect_to wedding_path(@wedding), notice: "Wedding Plan created"
    else
      flash.now[:alert] = "Invalid Wedding information"
      render status: :unprocessable_entity
    end
  end
end
