class CreateServices < ActiveRecord::Migration[7.1]
  def change
    create_table :services, id: :uuid do |t|
      t.string :name, null: false
      t.string :description
      t.references :wedding, null: false, foreign_key: { name: "wedding_fk_in_services" }, type: :uuid

      t.timestamps
    end
  end
end
