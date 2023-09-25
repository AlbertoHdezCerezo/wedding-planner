# frozen_string_literal: true

# Inspired by https://github.com/JedWatson/classnames

# Allow conditional class-name injection in components. This makes possible to
# rewrite an original component class set by adding new classes and disabling
# already existing classes in the component layout
module ClassNameHelper
  def class_names(*args) # rubocop:disable Metrics/AbcSize
    classes = []

    args.each do |class_arg|
      next if class_arg.blank?

      case class_arg
      # class_arg = "px-4 py-5 bg-gray-100"
      when String then classes += class_arg.split
      # class_arg = { "px-4": true, "py-2": false }
      when Hash
        class_arg.each do |key, value|
          next classes << key.to_s if value

          classes.delete_if { _1 == key.to_s }
        end
      # class_arg = %w[px-4 py-2 bg-gray-100]
      when Array then classes += class_arg
      else
        raise ArgumentError, "Argument '#{class_arg}' not valid as class argument for view component #{self.class.name}"
      end
    end

    classes.compact.uniq.join(" ")
  end
end
