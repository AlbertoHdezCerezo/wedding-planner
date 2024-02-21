class UpdateNilKindsInEvents < ActiveRecord::Migration[7.1]
  def up
    Event.where(kind: nil).update_all(kind: "other")
  end

  def down
  end
end
