class RemoveStateFromGuests < ActiveRecord::Migration[7.1]
  def change
    remove_column :guests, :state
  end
end
