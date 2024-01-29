# frozen_string_literal: true

class InvitationDecorator < ApplicationDecorator
  def guest_names = join_full_names(guest_decorators.map(&:full_name))

  def guest_decorators = @guest_decorators ||= guests.map { GuestDecorator.new(_1) }

  private

  def join_full_names(names)
    if names.is_a?(Array)
      names.size > 2 ? "#{names[0..-3].join(", ")}, #{join_full_names(names[-2..])}" : names.join(" & ")
    else
      names
    end
  end
end
