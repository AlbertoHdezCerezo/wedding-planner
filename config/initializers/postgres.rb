# frozen_string_literal: true

require "active_record/connection_adapters/postgresql_adapter"

# Adds a new type +timestampz+ to the set of +postgresql+ adapter kinds
module ActiveRecord
  module ConnectionAdapters
    class PostgreSQLAdapter
      NATIVE_DATABASE_TYPES.merge!(timestampz: { name: "timestamptz" })
    end
  end
end

# Sets +Rails+ to use +timestampz+ instead of +datetime+ in the backend to store
# datetime values. By tracking the time zone we do not need to take care of converting
# times to a common time zone before persisting.
ActiveRecord::ConnectionAdapters::PostgreSQLAdapter.datetime_type = :timestampz
