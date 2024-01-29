# frozen_string_literal: true

require "test_helper"

class DecoratableTest < ActiveSupport::TestCase
  class DecoratableModel
    include Decoratable
  end

  class DecoratableModelDecorator < ApplicationDecorator
  end

  class NonDecoratableModel
    include Decoratable
  end

  test "#decorator returns model decorator" do
    model = DecoratableModel.new
    decorator = model.decorator

    assert_kind_of DecoratableModelDecorator, decorator
    assert_equal model, decorator.__getobj__
  end

  test "#decorator if model has no decorator defined, raises exception" do
    model = NonDecoratableModel.new

    assert_raises(Decoratable::DecoratorNoDefinedError) { model.decorator }
  end
end
