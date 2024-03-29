# frozen_string_literal: true

require "test_helper"

class Html::AttributeTest < ActiveSupport::TestCase
  test ".build returns hashes attributes" do
    hashes = [
      { class: "px-1", data: { foo: true, action: "foo" }, id: "test1" },
      { class: "py-2", data: { bar: true }, "data-action": "bar", id: "test2", disabled: true }
    ]

    attributes = Html::TagAttributes.build(*hashes).to_h

    assert_equal(
      { class: "px-1 py-2", "data-foo": true, "data-action": "foo bar", id: "test2", "data-bar": true, disabled: true },
      attributes
    )
  end
end
