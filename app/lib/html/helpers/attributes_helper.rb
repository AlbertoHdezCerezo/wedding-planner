# frozen_string_literal: true

module Html::Helpers::AttributesHelper
  def prefixed_attribute_value(*hashes, prefix:) # rubocop:disable Metrics/AbcSize, Metrics/PerceivedComplexity
    return nil if hashes.empty?

    prefix = prefix.to_s unless prefix.is_a?(String)

    value = {}.tap do |result|
      hashes.each do |hash|
        next unless hash.is_a?(Hash)

        prefixed_attribute_pairs(hash:, prefix:).each do |(key_sym, key_value)|
          key = key_sym.to_s

          if key == prefix
            result.deep_merge!(key_value)
          else
            result[key.sub("#{prefix}-", "").to_sym] = key_value
          end
        end
      end
    end

    value.empty? ? nil : value
  end

  private

  def prefixed_attribute_pairs(hash:, prefix:)
    hash.to_a.select do |(key_sym, value)|
      key = key_sym.to_s

      # data: { attribute: "value" }
      (prefix == key && value.is_a?(Hash)) ||
        # data-attribute: "value"
        (key.start_with?(prefix) && prefix != key && !value.is_a?(Hash))
    end
  end
end
