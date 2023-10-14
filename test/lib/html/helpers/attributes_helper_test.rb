# frozen_string_literal: true

require "test_helper"

class Html::Helpers::AttributesHelperTest < ActiveSupport::TestCase
  class TestComponent < ApplicationComponent
    include Html::Helpers::AttributesHelper
  end

  attr_reader :component

  def setup
    @component = TestComponent.new
  end

  test ".prefixed_attribute_value returns hash merging all prefixed keys in hashes" do
    hash1 = { "data-foo": "true", foo: "foo" }
    hash2 = { "data-baz": "baz", bar: "bar", data: { bar: "false" } }

    merged_data = component.prefixed_attribute_value(hash1, hash2, prefix: :data)

    assert_equal({ foo: "true", bar: "false", baz: "baz" }, merged_data)
  end

  test ".prefixed_attribute_value if hashes has no prefix keys,
              return nil attribute" do
    assert_nil component.prefixed_attribute_value({ other: true }, prefix: :data)
  end

  test ".build_prefixed_attribute if hashes has prefix keys,
              return hash prefixed key values" do
    value = component.prefixed_attribute_value({ data: { foo: true } }, { "data-bar": false }, prefix: :data)

    assert_equal({ foo: true, bar: false }, value)
  end

  test ".build_prefixed_attribute if hashes has prefix keys,
              and a prefixed key is present within different hashes,
              returned hash prefixed key last hash value" do
    value = component.prefixed_attribute_value({ data: { bar: true } }, { "data-bar": false }, prefix: :data)

    assert_equal({ bar: false }, value)
  end
end
