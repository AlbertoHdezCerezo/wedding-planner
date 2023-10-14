# frozen_string_literal: true

# Helper for handling object +HTML+ attributes.
#
# With +Object+ attribute define +HTML+ attributes named with a common prefix,
# such as +aria+ attributes (+aria-role+, +aria-labelledby+, ...) or +data+
# attributes (+data-action+, +data-controller-target+, ...).
#
# These attributes share a common +prefix+ and are represented in ruby as a +Hash+
# and in +Javascript+ as am +Object+.
module HtmlObjectAttributeHelper
  # Given a set of +system_arguments+ and a +prefix+ finds all arguments prefixed
  # with the given +prefix+ and returns them merged in a single array. This is used
  # by the +Application+ component to infer object attributes such as +aria+ or +data+
  # from its +system_arguments+.
  #
  # Eg. html_object_attribute(prefix: :data, data: { foo: true }, data-bar: false, data-foo: false)
  #   will return { data: { foo: false, bar: false } }
  #
  # (!) The order of the arguments matters. If two or more arguments share the same name, the latest
  # argument will overwrite the previous argument values
  def extract_html_object_attribute(prefix, system_arguments)
    system_arguments.compact_blank.to_a.each_with_object({ prefix => nil }) do |(argument_name, argument_value), attribute|
      next unless name.start_with?(prefix)

      argument_hash = if argument_name.to_s == prefix.to_s
                        { prefix => argument_value }
                      else
                        { prefix => { argument_name.delete_prefix(prefix) => value } }
                      end

      attribute.deep_merge!(argument_hash)
    end
  end
end
