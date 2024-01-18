# frozen_string_literal: true

module Html
  # List of attributes which admit multiple values.
  ATTRIBUTES_WITH_MULTIPLE_VALUES = %w[class data-action].freeze
  PREFIXED_ATTRIBUTES = %w[data aria].freeze

  Attribute = Data.define(:name, :value) do
    extend Helpers::ClassNameHelper, Helpers::AttributesHelper

    class << self
      # Given an attribute +name+, seeks in the array of +hashes+ the last
      # hash which contaions a key with the same +name+ and assigns its
      # value to the returned +Attribute+.
      #
      # For special HTML attributes such as +class+ or +data-action+, the
      # method finds all +name+ keys in +hashes+ and concatenates them into
      # a single +String+ as value for the returned +Attribute+
      def build(*hashes, name:)
        value = if attribute_with_multiple_values?(name.to_s)
                  class_names(*hashes.pluck(name.to_sym).compact)
                elsif prefixed_attribute?(name.to_s)
                  prefixed_attribute_value(*hashes, prefix: name)
                else
                  hashes.pluck(name.to_sym).compact.last
                end

        new(name: name.to_sym, value:)
      end

      private

      def attribute_with_multiple_values?(name) = ATTRIBUTES_WITH_MULTIPLE_VALUES.include?(name)

      def prefixed_attribute?(name) = PREFIXED_ATTRIBUTES.include?(name)
    end

    def to_h = { name => value }.symbolize_keys
  end
end
