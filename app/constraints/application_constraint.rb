# frozen_string_literal: true

class ApplicationConstraint
  def self.matches?(_request) = raise "Constraint #{name} does not define match condition"
end
