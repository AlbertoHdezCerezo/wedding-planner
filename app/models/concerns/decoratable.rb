# frozen_string_literal: true

module Decoratable
  class DecoratorNoDefinedError < StandardError; end

  extend ActiveSupport::Concern

  included do
    def decorator
      @decorator ||= "#{self.class.name}Decorator".constantize.new(self)
    rescue NameError
      raise DecoratorNoDefinedError, <<-EXCEPTION
        There is no #{self.class.name}Decorator class defined for #{self.class.name} model.
      EXCEPTION
    end
  end
end
