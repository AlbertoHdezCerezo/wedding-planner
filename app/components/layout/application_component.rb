# frozen_string_literal: true

class Layout::ApplicationComponent < ApplicationComponent
  class BodyComponent < ApplicationComponent
    def call
      render BaseComponent.new(tag: :body)
    end
  end

  renders_one :body, "BodyComponent"

  attr_reader :title

  delegate_missing_to :helpers

  def initialize(title:, **system_arguments)
    @title = title
    super(**system_arguments)
  end
end
