# frozen_string_literal: true

class ApplicationComponent < ViewComponent::Base
  # Data attribute present in +HTML+ view component wrapper element
  VIEWCOMPONENT_ATTRIBUTE = "data-view-component"

  def self.stimulus_identifier = name.underscore.gsub("/", "--").tr("_", "-")

  def self.generate_id(suffix = nil) = "#{stimulus_identifier}-#{suffix || SecureRandom.uuid}"

  delegate :generate_id, to: :class

  attr_reader :id, :content_tag_args

  def initialize(**system_arguments)
    super
    @content_tag_args = ::Html::TagAttributes.build(
      { class: default_classes },
      default_content_tag_arguments,
      system_arguments
    ).to_h
  end

  def rendered_slots = instance_variable_get(:@__vc_set_slots)

  def rendered_slots_by_name(slot_name)
    slots = rendered_slots[slot_name]

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
