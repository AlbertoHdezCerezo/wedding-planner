# frozen_string_literal: true

class Invitation::Layout::ApplicationComponent < ApplicationComponent
  class BodyComponent < ApplicationComponent
    def call
      render(BaseComponent.new(tag: :body, **content_tag_arguments)) do
        content
      end
    end

    def default_content_tag_arguments
      {
        data: {
          controller: Invitation::Layout::ApplicationComponent.stimulus_identifier
        },
        class: <<-HTML
          h-screen w-screen flex items-center justify-center
        HTML
      }
    end
  end

  renders_one :body, BodyComponent

  attr_reader :title

  delegate_missing_to :helpers

  def initialize(title:, **system_arguments)
    @title = title
    super(**system_arguments)
  end
end
