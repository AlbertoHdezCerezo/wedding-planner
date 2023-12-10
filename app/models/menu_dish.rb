# frozen_string_literal: true

class MenuDish < ApplicationRecord
  # Associations
  belongs_to :menu, optional: false
  belongs_to :dish, optional: false
end
