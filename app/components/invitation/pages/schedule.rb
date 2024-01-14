# frozen_string_literal: true

class Invitation::Pages::Schedule < Invitation::Pages::Page
  def self.page_name = "schedule"

  attr_reader :wedding, :guest

  def initialize(wedding:, guest:, **system_arguments)
    @wedding = wedding
    @guest = guest
    super(**system_arguments)
  end
end