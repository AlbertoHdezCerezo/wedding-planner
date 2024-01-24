class CreateEventGuest < ActiveRecord::Migration[7.1]
  def change
    create_table :event_guests, primary_key: %i[event_id guest_id] do |t|
      t.references :event, null: false, foreign_key: true, type: :uuid
      t.references :guest, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
