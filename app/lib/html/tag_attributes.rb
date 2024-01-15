# frozen_string_literal: true

module Html
  TagAttributes = Data.define(:attributes) do
    def self.build(*hashes)
      flattened_hashes = hashes.map { flattened_hash(_1) }
      attribute_names = flattened_hashes.flat_map(&:keys).uniq

      new(attributes: attribute_names.map { |name| Attribute.build(*flattened_hashes, name:) })
    end

    # When we work with HTML attributes, the DOM does not handle nested
    # attributes (for example, { data: { foo: true, bar: false } } would
    # be represented as HTML attributes data-foo="true" & data-bar="false").
    #
    # This method flattens Hashes with nested Hashes so keys are
    # presented in an HTML attribute equivalent format (in the
    # example case,{ "data-foo": true, "data-bar": false })
    def self.flattened_hash(hash, parent_key = nil)
      result = {}

      hash.each do |key, value|
        current_key = (parent_key ? "#{parent_key}-#{key}" : key).to_sym

        if value.is_a?(Hash)
          result.merge!(flattened_hash(value, current_key))
        else
          result[current_key] = value
        end
      end

      result
    end

    def to_h = attributes.flat_map { _1.to_h.to_a }.to_h
  end
end
