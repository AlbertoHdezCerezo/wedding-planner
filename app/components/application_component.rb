# frozen_string_literal: true

class ApplicationComponent < ViewComponent::Base
  include Turbo::FramesHelper
  include TagAttributeHelper
  include ComponentHelper

  def self.stimulus_identifier = name.underscore.gsub("/", "--").tr("_", "-")

  def self.generate_id(suffix = nil) = "#{stimulus_identifier}-#{suffix || SecureRandom.uuid}"

  delegate :generate_id, :stimulus_identifier, to: :class

  attr_reader :id, :content_tag_arguments

  def initialize(**system_arguments)
    super

    @content_tag_arguments = ::Html::TagAttributes.build(
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

  private

  # Component predefined +content_tag+ arguments (+data-+ attributes)
  def default_content_tag_arguments = {}
end
