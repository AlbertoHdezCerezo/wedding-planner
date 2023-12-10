class CreateOffer < ActiveRecord::Migration[7.1]
  def change
    create_table :offers, id: :uuid do |t|
      t.references :organization, null: false, foreign_key: { name: "offer_fk_in_organization" }, type: :uuid
      t.references :service, null: false, foreign_key: { name: "offer_fk_in_service" }, type: :uuid
      t.monetize :price

      t.timestamps
    end
  end
end
