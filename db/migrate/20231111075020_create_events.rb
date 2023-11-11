class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events, id: :uuid do |t|
      t.references :wedding, null: false, foreign_key: { name: "wedding_fk_in_events" }, type: :uuid
      t.string :name, null: false
      t.string :description
      t.daterange :schedule, null: false
      t.boolean :planned, null: false, default: false

      t.timestamps
    end
  end
end
