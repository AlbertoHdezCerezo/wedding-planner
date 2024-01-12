# frozen_string_literal: true

class Invitation::Pages::Page < ApplicationComponent
  def self.page_name = raise "Page Component #{name} does not define page_name method"
end
