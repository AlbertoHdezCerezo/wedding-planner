# frozen_string_literal: true

class Dish < ApplicationRecord
  DIETARY_RESTRICTIONS = %w[
    gluten_free lactose-free nut-free shellfish-free soy-free vegetarian vegan
  ].freeze

  # Associations
  belongs_to :organization, optional: false
  has_many :menu_dishes, dependent: :destroy
  has_many :menus, through: :menu_dishes

  # Validations
  validates :name, presence: true
  validates :price_currency, presence: true
  validates :dietary_restrictions, inclusion: { in: DIETARY_RESTRICTIONS }
  monetize :price_cents,
           allow_nil: false,
           numericality: { greater_than_or_equal_to: 0 }
end
