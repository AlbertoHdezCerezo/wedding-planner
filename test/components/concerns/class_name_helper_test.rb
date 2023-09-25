# frozen_string_literal: true

require "test_helper"

class ClassNameHelperTest < ActiveSupport::TestCase
  class SampleComponent < ApplicationComponent
    include ClassNameHelper
  end

  attr_reader :component

  setup do
    @component = SampleComponent.new
  end

  test "#class_names returns a collection of CSS class names as a single string" do
    sample_class_names = %w[class1 class2 class3 class4]

    assert_equal "class1 class2 class3 class4", @component.class_names(*sample_class_names)
  end

  test "#class_names if CSS class names are passed as string argument,
              includes given strings in returned string" do
    sample_class_names = %w[class1 class2 class3 class4]

    component_classes = @component.class_names(*sample_class_names)

    assert_equal "class1 class2 class3 class4", component_classes
  end

  test "#class_names if CSS class names are passed as array argument,
              includes given strings in returned string" do
    sample_class_names = %w[class1 class2 class3 class4]

    component_classes = @component.class_names(sample_class_names)

    assert_equal "class1 class2 class3 class4", component_classes
  end

  test "#class_names if CSS class names are passed as hash argument with pairs class-name -> boolean,
              and boolean is set to true
              includes given strings in returned string" do
    sample_class_names = { class1: true, class2: true, class3: true, class4: true }

    component_classes = @component.class_names(sample_class_names)

    assert_equal "class1 class2 class3 class4", component_classes
  end

  test "#class_names if CSS class names are passed as hash argument with pairs class-name -> boolean,
              and boolean is set to false
              does not include given strings in returned string" do
    sample_class_names = { class1: false, class2: false, class3: false, class4: false }

    component_classes = @component.class_names(sample_class_names)

    assert_empty component_classes
  end

  test "#class_names if CSS class name is first passed as positive argument
              and then passed as negative argument
              do not include class in returned string" do
    sample_class_names = { class1: false, class2: false, class3: false, class4: false }

    component_classes = @component.class_names("class1", sample_class_names)

    assert_empty component_classes
  end

  test "#class_names if CSS class name is first passed as positive argument
              and then passed as negative argument
              and then passed as positive argument
              includes class in returned string" do
    sample_class_names = { class1: false, class2: false, class3: false, class4: false }

    component_classes = @component.class_names("class1", sample_class_names, "class1")

    assert_equal "class1", component_classes
  end
end
