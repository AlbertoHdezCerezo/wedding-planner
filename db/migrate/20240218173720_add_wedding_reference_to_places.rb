class AddWeddingReferenceToPlaces < ActiveRecord::Migration[7.1]
  def change
    add_reference :places, :wedding, null: true, foreign_key: true, type: :uuid
  end
end
