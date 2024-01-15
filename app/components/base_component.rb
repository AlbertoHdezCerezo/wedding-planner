# frozen_string_literal: true

class BaseComponent < ApplicationComponent
  # HTML self-closing tags (<.../> instead of <...></...>)
  SELF_CLOSING_TAGS = %i[area base br col embed hr img input link meta param source track wbr].freeze

  def initialize(tag: :div, **content_tag_arguments)
    @tag = tag
    super(**content_tag_arguments)
    @content_tag_arguments = content_tag_arguments
  end

  def call
    if SELF_CLOSING_TAGS.include?(@tag)
      tag(@tag, @content_tag_arguments)
    else
      content_tag(@tag, content, @content_tag_arguments)
    end
  end
end
