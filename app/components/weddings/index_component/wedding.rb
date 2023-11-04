# frozen_string_literal: true

class Weddings::IndexComponent::Wedding < ApplicationComponent
  with_collection_parameter :wedding

  attr_reader :wedding

  def initialize(wedding:, **system_arguments)
    @wedding = wedding
    super(**system_arguments)
  end

  private

  def default_content_tag_arguments
    {
      href: Rails.application.routes.url_helpers.wedding_path(wedding),
      class: <<-HTML
        p-6 border border-[1.5px] border-gray-200 rounded-lg cursor-pointer
        transition duration-200 opacity-90 hover:border-gray-500 hover:opacity-100
      HTML
    }
  end
end
