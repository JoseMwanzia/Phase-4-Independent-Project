class CreateTenants < ActiveRecord::Migration[7.0]
  def change
    create_table :tenants do |t|
      t.string :username
      t.string :email
      t.string :identification
      t.string :password_digest

      t.timestamps
    end
  end
end
