# frozen_string_literal: true

class ApplicationComponent < ViewComponent::Base
  # Data attribute present in +HTML+ view component wrapper element
  VIEWCOMPONENT_ATTRIBUTE = "data-view-component"

  # HTML self-closing tags (<.../> instead of <...></...>)
  SELF_CLOSING_TAGS = %i[area base br col embed hr img input link meta param source track wbr].freeze

  def initialize(tag:, classes:, **system_arguments)
    super

    @tag = tag
    @system_arguments = system_arguments
    @system_arguments[VIEWCOMPONENT_ATTRIBUTE.to_sym] = true
    @content_tag_args = @system_arguments
  end

  def call
    if SELF_CLOSING_TAGS.include?(@tag)
      tag(@tag, @content_tag_args.merge(@result))
    else
      content_tag(@tag, content, @content_tag_args.merge(@result))
    end
  end
end
