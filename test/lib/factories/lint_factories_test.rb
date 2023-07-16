require "test_helper"

class LintFactoriesTest < ActiveSupport::TestCase
  # Tests all factories and their traits can be created, raises exception on db constraint and validation failures
  test "All factories can be created" do
    FactoryBot.lint(traits: true, verbose: true)
  end
end
