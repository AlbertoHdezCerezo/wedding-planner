# frozen_string_literal: true

require "test_helper"

class StimulusHelperTest < ActiveSupport::TestCase
  include StimulusHelper

  test "#stimulus_action_option returns hash with right Stimulus action value" do
    assert_equal(
      { "data-action" => "click->myController#myAction" },
      stimulus_action_option("click", "myController", "myAction")
    )
  end

  test "#stimulus_css_class_option returns hash with right Stimulus css class key" do
    assert_equal(
      { "data-my-controller-sample-class" => "css-class" },
      stimulus_css_class_option("my-controller", "sample", "css-class")
    )
  end

  test "#stimulus_target_option returns hash with right Stimulus target key and value" do
    assert_equal(
      { "data-my-controller-target" => "myTarget" },
      stimulus_target_option("myTarget", "my-controller")
    )
  end

  test "#stimulus_value_option returns hash with right Stimulus value key and value" do
    assert_equal(
      { "data-my-controller-sample-value" => "myValue" },
      stimulus_value_option("my-controller", "sample", "myValue")
    )
  end
end
