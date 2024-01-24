# frozen_string_literal: true

class Invitations::EditComponent < ApplicationComponent
  attr_reader :wedding, :invitation

  def initialize(wedding:, invitation:, **system_arguments)
    super(**system_arguments)
    @wedding = wedding
    @invitation = invitation
  end

  protected

  def default_classes
    "py-4 rounded-md bg-white flex flex-col gap-3"
  end
end
