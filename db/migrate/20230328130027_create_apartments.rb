class CreateApartments < ActiveRecord::Migration[7.0]
  def change
    create_table :apartments do |t|
      t.string :name
      t.string :location
      t.string :type
      t.belongs_to :landlord, null: false, foreign_key: true
      t.has_many :houses, null: false, foreign_key: true

      t.timestamps
    end
  end
end