class CreateOrganization < ActiveRecord::Migration[7.1]
  def change
    create_table :organizations, id: :uuid do |t|
      t.string :name, null: false
      t.string :description, null: true

      t.timestamps
    end
  end
end
