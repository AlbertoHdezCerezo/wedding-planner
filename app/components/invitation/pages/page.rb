# frozen_string_literal: true

class Invitation::Pages::Page < ApplicationComponent
  attr_reader :preview_mode

  def self.page_name = raise "Page Component #{name} does not define page_name method"
end
