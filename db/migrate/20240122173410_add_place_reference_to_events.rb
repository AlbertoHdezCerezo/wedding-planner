class AddPlaceReferenceToEvents < ActiveRecord::Migration[7.1]
  def change
    add_reference :events, :place, null: true, foreign_key: true, type: :uuid
  end
end
