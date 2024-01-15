class CreatePlace < ActiveRecord::Migration[7.1]
  def change
    create_table :places, id: :uuid do |t|
      t.string :name, null: false
      t.references :address, null: false, foreign_key: true, type: :uuid
      t.string :maps_url
      t.string :phone
      t.string :email

      t.timestamps
    end

    add_index :places, :name, name: "name_index_in_places", unique: true
    add_index :places, :address_id, name: "address_fk_in_places", unique: true
  end
end
