# frozen_string_literal: true

module Html
  CLASS_ATTRIBUTE = "class"
  PREFIXED_ATTRIBUTES = %w[data aria].freeze

  Attribute = Data.define(:name, :value) do
    extend Helpers::ClassNameHelper, Helpers::AttributesHelper

    class << self
      def build(*hashes, name:)
        value = if class_attribute?(name.to_s)
                  class_names(*hashes.pluck(:class).compact)
                elsif prefixed_attribute?(name.to_s)
                  prefixed_attribute_value(*hashes, prefix: name)
                else
                  hashes.pluck(name.to_sym).compact.last
                end

        new(name: name.to_sym, value:)
      end

      private

      def class_attribute?(name) = name == CLASS_ATTRIBUTE

      def prefixed_attribute?(name) = PREFIXED_ATTRIBUTES.include?(name)
    end

    def to_h = { name => value }.symbolize_keys
  end
end
