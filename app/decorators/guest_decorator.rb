# frozen_string_literal: true

class GuestDecorator < ApplicationDecorator
  def full_name = "#{name} #{surname}"
end
