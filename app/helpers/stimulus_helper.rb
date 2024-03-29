# frozen_string_literal: true

module StimulusHelper
  def stimulus_action_option(event, controller_identifier, action)
    { "data-action" => stimulus_action_value(event, controller_identifier, action) }
  end

  def stimulus_action_value(event, controller_identifier, action)
    "#{event}->#{controller_identifier}##{action}"
  end

  def stimulus_controller_option(controller_identifier)
    { "data-controller" => controller_identifier }
  end

  def stimulus_css_class_option(class_name, controller_identifier, css_class)
    { stimulus_css_class_key(controller_identifier, class_name) => css_class }
  end

  def stimulus_css_class_key(controller_identifier, class_name)
    "data-#{controller_identifier}-#{class_name}-class"
  end

  def stimulus_parameter_option(name, controller_identifier, value)
    { stimulus_parameter_key(name, controller_identifier) => value }
  end

  def stimulus_parameter_key(name, controller_identifier)
    "data-#{controller_identifier}-#{dasherize(name)}-param"
  end

  def stimulus_target_option(name, controller_identifier)
    { stimulus_target_key(controller_identifier) => name }
  end

  def stimulus_target_key(controller_identifier) = "data-#{controller_identifier}-target"

  def stimulus_value_option(value_name, controller_identifier, value)
    { stimulus_value_key(controller_identifier, value_name) => value }
  end

  def stimulus_value_key(controller_identifier, value_name)
    "data-#{controller_identifier}-#{dasherize(value_name)}-value"
  end

  private

  # Special dasherize logic for Stimulus related keys (like value names)
  def dasherize(string) = string.to_s.underscore.dasherize.gsub("/", "--")
end
