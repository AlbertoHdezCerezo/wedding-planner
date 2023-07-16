require "test_helper"

class ApplicationRecordTest < ActiveSupport::TestCase
  UUID_SQL_TYPE = "uuid"

  test "All ApplicationRecord model classes use UUID format in their table ID columns" do
    assert model_classes.all? { id_sql_type(_1) == UUID_SQL_TYPE }, <<-MESSAGE
      Expected all ApplicationRecord model classes to define its ID column as UUID sql type.
      Some models do not have ID column as UUID: #{ model_classes.reject { id_sql_type(_1) == UUID_SQL_TYPE }.map(&:name) }.
    MESSAGE
  end

  private

  def model_classes = ApplicationRecord.descendants

  def id_sql_type(model_class) = model_class.column_for_attribute(:id).sql_type_metadata.sql_type
end
