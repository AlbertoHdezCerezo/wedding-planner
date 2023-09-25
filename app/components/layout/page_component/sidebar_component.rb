# frozen_string_literal: true

class Layout::PageComponent::SidebarComponent < ApplicationComponent
  attr_reader :current_path

  def initialize(current_path: nil, classes: nil, **system_arguments)
    @current_path = current_path
    super
  end

  def before_render
    @current_path = current_path.presence || request.path
  end

  def in_current_path?(item_path) = current_path.include?(item_path)

  def items
    {
      weddings: weddings_path
    }.freeze
  end
end
