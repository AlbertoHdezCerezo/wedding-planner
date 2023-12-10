class CreateDish < ActiveRecord::Migration[7.1]
  def change
    create_table :dishes, id: :uuid do |t|
      t.string :name, null: false
      t.string :description, null: true
      t.string :dietary_restrictions, array: true, null: false, default: []
      t.monetize :price

      t.references :organization, null: false, foreign_key: { name: "dish_fk_in_organization" }, type: :uuid

      t.timestamps
    end
  end
end
