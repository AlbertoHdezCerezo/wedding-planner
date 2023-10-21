# frozen_string_literal: true

class ApplicationParameters < SimpleDelegator
  def self.schema
    "#{name}::Schema".constantize
  rescue NameError
    raise "Parameter class #{name} does not define Schema"
  end

  delegate :schema, to: :class

  attr_reader :params

  def initialize(params)
    params.permit!
    super(schema.call(params.to_h).output)
  end
end
