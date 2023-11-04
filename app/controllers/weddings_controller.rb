# frozen_string_literal: true

class WeddingsController < ApplicationController
  # GET /weddings
  def index
    @weddings = Wedding.all
  end

  # GET /weddings/new
  def new
    @wedding = Wedding.new
  end

  # POST /weddings
  def create
  end

  # GET /weddings/<wedding-id>
  def show
    @wedding = if Wedding.count == 0
                 Wedding.create(date: Date.new(2023, 9, 14))
               else
                 Wedding.first
               end
  end
end
