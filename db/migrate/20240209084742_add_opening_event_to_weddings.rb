class AddOpeningEventToWeddings < ActiveRecord::Migration[7.1]
  def change
    add_reference :weddings, :opening_event, null: true, type: :uuid, foreign_key: { to_table: :events, name: "opening_event_fk_in_weddings" }, index: true
  end
end
