# frozen_string_literal: true

class Examples::WithControllerComponent < ApplicationComponent
  STIMULUS_CONTROLLER = ::StimulusControllerArguments.from_component(self).freeze

  def call
    render BaseComponent.new(tag: :div, **STIMULUS_CONTROLLER.element_arguments)
  end
end
