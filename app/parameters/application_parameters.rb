# frozen_string_literal: true

class ApplicationParameters < SimpleDelegator
  def self.schema
    "#{name}::Schema".constantize
  rescue NameError
    raise "Parameter class #{name} does not define Schema"
  end

  delegate :schema, to: :class

  attr_reader :params, :parsed_params

  def initialize(params)
    params.permit!
    @params = params
    @parsed_params = schema.call(params.to_h)
    super(schema.call(params.to_h).output.except(*excluded_parameters))
  end

  def valid? = parsed_params.errors.empty?

  # Collection of keys representing +Schema+ +parameters+
  # which will be excluded from output.
  def excluded_parameters = []
end
