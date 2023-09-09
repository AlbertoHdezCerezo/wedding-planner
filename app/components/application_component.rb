# frozen_string_literal: true

class ApplicationComponent < ViewComponent::Base
  # Data attribute present in +HTML+ view component wrapper element
  VIEWCOMPONENT_ATTRIBUTE = "data-view-component"

  # Stimulus Methods

  def initialize(classes: nil, **system_arguments)
    super

    @classes = classes

    system_arguments[VIEWCOMPONENT_ATTRIBUTE.to_sym] = true

    @content_tag_args = system_arguments
    @content_tag_args = @content_tag_args.merge({ class: classes }) if classes.present?
  end

  protected

  # Component predefined classes
  def default_classes = nil

  # Component predefined +content_tag+ arguments (+data-+ attributes)
  def default_content_tag_arguments = nil
end
