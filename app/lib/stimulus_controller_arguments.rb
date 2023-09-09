# frozen_string_literal: true

class StimulusControllerArguments
  def self.identifier(component) = component.name.underscore.gsub("/", "--").tr("_", "-")

  def self.from_component(component) = new(identifier: identifier(component))

  attr_reader :identifier

  def initialize(identifier:)
    @identifier = identifier
  end

  def element_arguments
    {
      data: {
        controller: identifier
      }
    }
  end
end
