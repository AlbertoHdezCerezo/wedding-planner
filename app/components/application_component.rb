# frozen_string_literal: true

class ApplicationComponent < ViewComponent::Base
  # Helper Concerns
  include ClassNameHelper

  # Data attribute present in +HTML+ view component wrapper element
  VIEWCOMPONENT_ATTRIBUTE = "data-view-component"

  attr_reader :content_tag_args

  def initialize(classes: nil, **system_arguments)
    super

    @classes = class_names(default_classes, classes)

    system_arguments[VIEWCOMPONENT_ATTRIBUTE.to_sym] = true

    @content_tag_args = default_content_tag_arguments.merge(system_arguments)
    @content_tag_args = @content_tag_args.merge({ class: @classes }) if @classes.present?
  end

  def rendered_slots = self.instance_variable_get(:@__vc_set_slots)

  def rendered_slots_by_name(slot_name)
    slots = rendered_slots.dig(slot_name)

    return [] if slots.nil?

    return [slots] unless slots.is_a?(Array)

    slots
  end

  protected

  # Component predefined classes
  def default_classes = nil

  # Component predefined +content_tag+ arguments (+data-+ attributes)
  def default_content_tag_arguments = {}
end
