# frozen_string_literal: true

class IpConstraint < ApplicationConstraint
  ALLOWED_IPS = ENV.fetch("ALLOWED_ADMIN_IPS", "").split(",")

  def self.matches?(request)
    if Rails.env.production?
      client_ip = request.headers["X-Forwarded-For"].split(",").first
      client_ip.in?(ALLOWED_IPS)
    else
      true
    end
  end
end
