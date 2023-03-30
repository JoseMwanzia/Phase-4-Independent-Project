class CreateHouses < ActiveRecord::Migration[7.0]
  def change
    create_table :houses do |t|
      t.string :image_url
      t.string :house_number
      t.text :description
      t.decimal :rent
      t.belongs_to :tenant, null: false, foreign_key: true
      t.belongs_to :apartment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
