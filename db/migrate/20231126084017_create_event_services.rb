class CreateEventServices < ActiveRecord::Migration[7.1]
  def change
    create_table :event_services, id: :uuid do |t|
      t.references :event, null: false, foreign_key: { name: "event_fk_in_event_services" }, type: :uuid
      t.references :service, null: false, foreign_key: { name: "service_fk_in_event_services" }, type: :uuid

      t.timestamps
    end
  end
end
