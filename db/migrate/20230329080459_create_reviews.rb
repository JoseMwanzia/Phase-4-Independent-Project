class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.string :description
      t.belongs_to :tenant, null: false, foreign_key: true
      t.belongs_to :house, null: false, foreign_key: true

      t.timestamps
    end
  end
end
