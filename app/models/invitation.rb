# frozen_string_literal: true

class Invitation < ApplicationRecord
  belongs_to :wedding, optional: false
end
