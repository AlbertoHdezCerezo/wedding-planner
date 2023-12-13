# frozen_string_literal: true

class Weddings::EditComponent < ApplicationComponent
  attr_reader :wedding

  def initialize(wedding:, **system_arguments)
    super(**system_arguments)
    @wedding = wedding
  end

  def editing? = !wedding.new_record?
end
