class CreateApartments < ActiveRecord::Migration[7.0]
  def change
    create_table :apartments do |t|
      t.string :name
      t.string :location
      t.string :category
      t.belongs_to :landlord, null: false, foreign_key: true
      t.integer :house_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
