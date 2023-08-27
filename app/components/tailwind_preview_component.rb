# frozen_string_literal: true

class TailwindPreviewComponent < ApplicationComponent
  def call = render BaseComponent.new(tag: :iframe, class: "w-screen h-screen", src: "/tailwind-preview/index.html")
end
