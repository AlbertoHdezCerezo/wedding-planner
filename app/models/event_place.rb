# frozen_string_literal: true

class EventPlace < ApplicationRecord
  belongs_to :event
  belongs_to :place
end
