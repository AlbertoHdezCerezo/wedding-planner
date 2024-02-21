class AddKindToEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :kind, :string, null: false
  end
end
