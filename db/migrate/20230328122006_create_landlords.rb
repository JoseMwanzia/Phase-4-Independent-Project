class CreateLandlords < ActiveRecord::Migration[7.0]
  def change
    create_table :landlords do |t|
      t.string :username
      t.integer :contact_number
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
