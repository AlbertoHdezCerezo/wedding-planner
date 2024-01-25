# frozen_string_literal: true

class Layout::PageComponent < ApplicationComponent
  DEFAULT_BODY_TAG_ARGUMENTS = {
    class: "flex-1 h-full flex flex-col gap-6 px-20 py-12 overflow-hidden"
  }.freeze

  attr_reader :body_tag_arguments

  def initialize(body_tag_arguments: nil, **content_tag_arguments)
    @tag = tag

    @body_tag_arguments = if body_tag_arguments.present?
                            Html::TagAttributes.build(DEFAULT_BODY_TAG_ARGUMENTS, body_tag_arguments).to_h
                          else
                            DEFAULT_BODY_TAG_ARGUMENTS
                          end

    super(**content_tag_arguments)
  end

  private

  def default_content_tag_arguments
    { class: "w-screen h-screen flex flex-row bg-white" }
  end
end
