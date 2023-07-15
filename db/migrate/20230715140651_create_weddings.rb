class CreateWeddings < ActiveRecord::Migration[7.0]
  def change
    create_table :weddings do |t|
      t.date :date
      t.string :description

      t.timestamps
    end
  end
end
