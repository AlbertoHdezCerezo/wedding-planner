class CreateGuests < ActiveRecord::Migration[7.0]
  def change
    create_table :guests, id: :uuid do |t|
      t.references :wedding, null: false, foreign_key: true, type: :uuid
      t.integer :state, default: 0, null: false
      t.datetime :invited_at
      t.datetime :confirmed_at
      t.datetime :cancelled_at

      t.timestamps
    end

    add_index :guests, :state
  end
end
