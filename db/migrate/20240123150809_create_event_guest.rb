class CreateEventGuest < ActiveRecord::Migration[7.1]
  def change
    create_table :event_guests, id: :uuid do |t|
      t.references :event, null: false, foreign_key: true, type: :uuid
      t.references :guest, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end

    add_index :event_guests, %i[event_id guest_id], name: "event_guest_index_in_event_guests", unique: true
  end
end
