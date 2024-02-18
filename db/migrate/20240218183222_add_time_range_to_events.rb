class AddTimeRangeToEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :start_time, :timestampz
    add_column :events, :end_time, :timestampz
  end
end
