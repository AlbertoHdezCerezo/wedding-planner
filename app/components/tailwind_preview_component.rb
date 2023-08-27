# frozen_string_literal: true

class TailwindPreviewComponent < ApplicationComponent
  def call = render BaseComponent.new(tag: :div, src: "/tailwind-preview/index.html")
end
