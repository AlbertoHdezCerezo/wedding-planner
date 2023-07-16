# frozen_string_literal: true

require "active_record/connection_adapters/postgresql_adapter"

# Forces Rails to use +postgresql+ +timestampz+ datetime type. This type keeps tracks
# datetime values with a timezone, which makes easier to handle them when converting
# times to different time zones.
ActiveRecord::ConnectionAdapters::PostgreSQLAdapter.datetime_type = :timestampz
