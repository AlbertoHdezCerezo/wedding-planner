class CreateWeddings < ActiveRecord::Migration[7.0]
  def change
    create_table :weddings, id: :uuid do |t|
      t.date :date
      t.string :description

      t.timestamps
    end
  end
end
