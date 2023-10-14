# frozen_string_literal: true

module Html
  TagAttributes = Data.define(:attributes) do
    def self.build(*hashes)
      attribute_names = hashes.flat_map(&:keys).uniq

      new(attributes: attribute_names.map { |name| Attribute.build(*hashes, name:) })
    end

    def to_h = attributes.flat_map { _1.to_h.to_a }.to_h
  end
end
