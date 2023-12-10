# frozen_string_literal: true

require "test_helper"

class OrganizationTest < ActiveSupport::TestCase
  # Validations
  test "validates presence of name" do
    organization = Organization.new
    organization.name = nil

    assert_not organization.valid?
    assert organization.errors.of_kind?(:name, :blank)
  end
end
