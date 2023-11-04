class AddNameToWeddings < ActiveRecord::Migration[7.1]
  def change
    add_column :weddings, :name, :string, null: false
  end
end
