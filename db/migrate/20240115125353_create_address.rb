class CreateAddress < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses, id: :uuid do |t|
      t.string :addressee
      t.string :street
      t.string :number
      t.string :zip_code
      t.string :town
      t.string :country
      t.string :state

      t.timestamps
    end
  end
end
