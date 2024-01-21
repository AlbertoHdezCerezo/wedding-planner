class CreateEventPlace < ActiveRecord::Migration[7.1]
  def change
    create_table :event_places do |t|
      t.references :event, null: false, foreign_key: true, type: :uuid
      t.references :place, null: false, foreign_key: true, type: :uuid
      t.text :description, null: true

      t.timestamps
    end

    add_index :event_places, :event_id, name: "event_in_event_places"
    add_index :event_places, :place_id, name: "place_in_event_places"
    add_index :event_places, [:event_id, :place_id], unique: true, name: "unique_event_and_place_index_in_event_places"
  end
end
