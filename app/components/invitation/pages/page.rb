# frozen_string_literal: true

class Invitation::Pages::Page < Invitation::ApplicationComponent
  attr_reader :preview_mode

  def initialize(preview_mode: false, **system_arguments)
    super(**system_arguments)
    @preview_mode = preview_mode
  end

  def self.page_name = raise "Page Component #{name} does not define page_name method"
end
