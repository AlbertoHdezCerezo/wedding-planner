# frozen_string_literal: true

require "test_helper"

class Html::AttributeTest < ActiveSupport::TestCase
  test ".build if attribute name is not present in hashes,
              returns name attribute with nil value" do
    attribute = Html::Attribute.build({}, name: :attribute)

    assert_nil attribute.value
  end

  test ".build if attribute name is present in one hash,
              returns name attribute with hash attribute value" do
    attribute = Html::Attribute.build({ attribute: true }, name: :attribute)

    assert attribute.value
  end

  test ".build if attribute name is present in multiple hash,
              returns name attribute with attribute value in last hash" do
    attribute = Html::Attribute.build({ attribute: true }, { attribute: false }, {}, name: :attribute)

    assert_not attribute.value
  end

  test ".build if attribute name is class, return class attribute" do
    attribute = Html::Attribute.build({ class: "px-1" }, { class: { "py-2": true } }, {}, name: :class)

    assert_equal "px-1 py-2", attribute.value
  end

  test ".build if attribute name is data, return data prefixed attribute" do
    attribute = Html::Attribute.build({ data: { foo: true } }, { "data-bar": true }, {}, name: :data)

    assert_equal({ foo: true, bar: true }, attribute.value)
  end

  test ".build if attribute name is data-action, return 'data-action' values from each hash joint" do
    attribute = Html::Attribute.build(
      { "data-action": "click->clipboard#copy" },
      { "data-action": "click->navigator#openPage" },
      name: "data-action"
    )

    assert_equal "click->clipboard#copy click->navigator#openPage", attribute.value
  end

  test ".build if attribute name is aria, return data prefixed attribute" do
    attribute = Html::Attribute.build({ aria: { foo: true } }, { "aria-bar": true }, {}, name: :aria)

    assert_equal({ foo: true, bar: true }, attribute.value)
  end
end
