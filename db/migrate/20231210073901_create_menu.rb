class CreateMenu < ActiveRecord::Migration[7.1]
  def change
    create_table :menus, id: :uuid do |t|
      t.string :name, null: false
      t.string :description, null: true

      t.references :organization, null: false, foreign_key: { name: "menu_fk_in_organization" }, type: :uuid

      t.timestamps
    end
  end
end
