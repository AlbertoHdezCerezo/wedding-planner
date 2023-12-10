class CreateMenuDish < ActiveRecord::Migration[7.1]
  def change
    create_table :menu_dishes, id: :uuid do |t|
      t.references :menu, null: false, foreign_key: { name: "menu_dish_fk_in_menu" }, type: :uuid
      t.references :dish, null: false, foreign_key: { name: "menu_dish_fk_in_dish" }, type: :uuid

      t.timestamps
    end
  end
end
