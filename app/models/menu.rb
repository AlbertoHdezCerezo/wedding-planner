# frozen_string_literal: true

class Menu < ApplicationRecord
  # Associations
  belongs_to :organization, optional: false
  has_many :menu_dishes, dependent: :destroy
  has_many :dishes, through: :menu_dishes

  # Validations
  validates :name, presence: true
end
